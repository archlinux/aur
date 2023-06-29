# Maintainer:
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>
# Contributor: loqs

pkgname=atom
_tag=1.61.0-beta0
pkgver=${_tag//-}
pkgrel=3
pkgdesc='A hackable text editor for the 21st Century'
arch=(x86_64)
url="https://github.com/atom/$pkgname"
license=(MIT)
_electron=electron11
depends=(apm
         $_electron
         libxkbfile
         ripgrep)
makedepends=(git
             node-gyp
             nodejs-lts-gallium
             npm)
optdepends=('ctags: symbol indexing support'
            'git: Git and GitHub integration'
            'hunspell: spell check integration')
replaces=(atom-editor)
options=(!emptydirs)
_archive="$pkgname-$_tag"
source=("$url/archive/v$_tag/$_archive.tar.gz"
        "$pkgname.js"
        dugite-use-system-git.patch
        "fix-$pkgname-sh.patch"
        fix-license-path.patch
        fix-restart.patch
        git-utils.patch
        no-unsafe-eval-warning.patch
        node-env-production.patch
        symbols-view-use-system-ctags.patch
        use-system-apm.patch
        use-system-electron.patch)
sha256sums=('77596888a88140aa3a8d0395b20ea1140621ce11521266f268bd400a1c25f299'
            'cd39815e7f9a72be0c7ac2e15106f8bb8774c0cbc0960725b0b677d0ce67d828'
            '530b46d31df0f5e8f5881e1608a66fe75d549092a6db2e72ba3ad69c48714153'
            '13ed58df53ab8fb9a0f505ad4d860aa61e5ed00a280ad7ff27dcaa360e31d896'
            '954a82abeb0d144891449e3db2126ee3007bea63737146a2239997c932520cbc'
            '5f9946b33024b429b3951629b0e3fd6deeb88895b3467a7e8e0c504b0accd9c5'
            'e321fdfe880cd465918dd1dbb90e4c7d46fc5310f20666eddf0a41cbca4f8ac8'
            '40d783794d62f12f3c429c624a84265871c7ed95f4120c9db800348896dd5437'
            'a09439c2a908ca174ff3be1f0d85071d12c792ae19748e36fe601e372d6d925b'
            'c93cc88dd704388d4b26a0de0a5938df7ff90cedf8eed0b3b8a675f9cc7d487c'
            '08ae0c93b5ec7eb7d90c65d5d2adbaca538482fba902ed1f8414024db0d21854'
            '5e6e05fe09642e4a18d6c44764fb18498460b53b285420b5acc6a3622e9dc6d2')

_electron_version=$(< /usr/lib/$_electron/version)

prepare() {
	cd "$_archive"
	patch -Np1 -i ../fix-$pkgname-sh.patch
	patch -Np1 -i <(sed -e "s/@ELECTRON@/$_electron/" ../use-system-electron.patch)
	patch -Np1 -i ../use-system-apm.patch
	patch -Np1 -i ../fix-license-path.patch
	patch -Np1 -i ../fix-restart.patch
	patch -Np1 -i ../node-env-production.patch
	patch -Np1 -i ../no-unsafe-eval-warning.patch

	CXXFLAGS="${CXXFLAGS/ -fexceptions/}"
	env \
		ATOM_RESOURCE_PATH="$PWD" ATOM_HOME="$srcdir/.atom" \
		npm_config_build_from_source=true \
		npm_config_target=$_electron_version \
		GYP_DEFINES="openssl_fips=" \
		apm install --cache "$srcdir/npm-cache"

	# Use system ctags
	pushd node_modules/symbols-view
	patch -Np1 -i "$srcdir/symbols-view-use-system-ctags.patch"
	rm -r lib/ctags-config vendor
	popd

	# Use system git
	pushd node_modules/dugite
	patch -Np1 -i "$srcdir/dugite-use-system-git.patch"
	rm -r git
	popd

	# Fix issue with:
	# build/Release/git.node: undefined symbol: git_net_url_is_default_port
	pushd node_modules/git-utils
	patch -Np1 -i "$srcdir/git-utils.patch"
	popd

	pushd script
	npm install --cache "$srcdir/npm-cache"
}

build() {
	cd "$_archive"

	pushd node_modules/git-utils
	env \
		npm_config_disturl=https://electronjs.org/headers \
		npm_config_runtime=$_electron \
		npm_config_target=$_electron_version \
		apm rebuild
	popd

	pushd script
	# Hack to avoid using Node > 12 (https://github.com/babel/babel/issues/11216)
	# Set ELECTRON_VERSION (see use-system-electron.patch)
	env \
		ELECTRON_RUN_AS_NODE=1 \
		ELECTRON_VERSION=$_electron_version \
		$_electron build --no-bootstrap
}

package() {
	cd "$_archive"

	install -dm0755 "$pkgdir/usr/lib"
	cp -r out/app "$pkgdir/usr/lib/$pkgname"
	install -m0644 out/startup.js "$pkgdir/usr/lib/$pkgname"
	sed -e "s/@ELECTRON@/$_electron/" "$srcdir/$pkgname.js" |
		install -Dm0755 /dev/stdin "$pkgdir/usr/lib/$pkgname/$pkgname"

	ln -sf /usr/bin/rg "$pkgdir/usr/lib/$pkgname/node_modules/vscode-ripgrep/bin/rg"

	install -dm0755 "$pkgdir/usr/share/applications"
	sed -e "s|<%= appName %>|Atom|" \
		-e "s/<%= description %>/$pkgdesc/" \
		-e "s|<%= installDir %>|/usr|" \
		-e "s|<%= appFileName %>|$pkgname|" \
		-e "s|<%= iconPath %>|$pkgname|" \
		resources/linux/atom.desktop.in > "$pkgdir/usr/share/applications/$pkgname.desktop"

	for size in 16 24 32 48 64 128 256 512 1024; do
		install -Dm0644 "resources/app-icons/stable/png/$size.png" \
				"$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
	done
	ln -sf "../../../share/icons/hicolor/1024x1024/apps/$pkgname.png" \
		"$pkgdir/usr/lib/$pkgname/resources/$pkgname.png"

	install -Dm0755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

	install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
	node -e "require('./script/lib/get-license-text')().then((licenseText) => require('fs').writeFileSync('$pkgdir/usr/share/licenses/$pkgname/LICENSE.md', licenseText))"

	# Remove useless stuff
	find "$pkgdir/usr/lib/$pkgname/node_modules" \
		-name '*.a' -exec rm '{}' \; \
		-or -name '*.bat' -exec rm '{}' \; \
		-or -name '*.c' -exec rm '{}' \; \
		-or -name '*.cpp' -exec rm '{}' \; \
		-or -name '*.node' -exec chmod a-x '{}' \; \
		-or -name 'benchmark' -prune -exec rm -r '{}' \; \
		-or -name 'doc' -prune -exec rm -r '{}' \; \
		-or -name 'html' -prune -exec rm -r '{}' \; \
		-or -name 'man' -prune -exec rm -r '{}' \; \
		-or -name 'scripts' -prune -exec rm -r '{}' \; \
		-or -path '*/.github/workflows' -prune -exec rm -r '{}' \; \
		-or -path '*/less/gradle' -prune -exec rm -r '{}' \; \
		-or -path '*/task-lists/src' -prune -exec rm -r '{}' \;
}

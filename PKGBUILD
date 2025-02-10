# Maintainer: Julian Pollinger <julian@pollinger.dev>

pkgname=mattermost-desktop-git
_pkgname=mattermost-desktop
pkgver=5.12.0.c9514850
pkgrel=1
pkgdesc="Mattermost Desktop for Linux (git)"
arch=('x86_64')

url="https://github.com/mattermost/desktop"
license=('Apache')
_electron=electron34

makedepends=('jq' 'nodejs' 'npm' 'git' 'asar' 'rpm-tools' 'moreutils')
depends=($_electron 'libxcrypt-compat' 'alsa-lib' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
optdepends=()

conflicts=('mattermost-desktop')
provides=("${_pkgname}")

source=('git+https://github.com/mattermost/desktop.git#branch=master' ${_pkgname}.desktop ${_pkgname}.sh)
sha256sums=('SKIP'
            '29d8bdc503ec71d69efa8b73655a230df00c18667c875a73cb8de31a6d86dd2a'
            '1c2bf48b6397d04a5a536c5c9f4960db53249c838c380f03f808c612b00ba4c6')

prepare() {

    cd 'desktop'

    sed -e "s/@ELECTRON@/$_electron/" "../$_pkgname.sh" > "$_pkgname.sh"

    local _electronVersion="$(< "/usr/lib/$_electron/version")"

    jq '.linux["target"] = [ "dir" ]' electron-builder.json | sponge electron-builder.json


    jq '	.devDependencies["electron"] = $electronVersion |
		del(.devDependencies["electron-rebuild"]) |
		.config.target = $electronVersion |
		.config.runtime = $electronRuntime' \
			--arg electronRuntime "$_electron" \
			--arg electronVersion "$_electronVersion" \
			package.json |
		sponge package.jsons
	  sed -i -e '/package:/s/tar.gz deb rpm/dir/' package.json


    _npmargs="--cache $srcdir/npm-cache --no-audit --no-fund"

    CFLAGS="-Wno-implicit-function-declaration" npm $_npmargs install
}

build() {
    cd 'desktop'

    export NODE_ENV=production
    _npmargs="--cache $srcdir/npm-cache --no-audit --no-fund"

    npm $_npmargs --offline run build-prod 
    npx electron-builder --linux tar.gz --x64 --publish=never
}

package() {
  cd 'desktop'

  install -Dm0644 -t "$pkgdir/usr/lib/$_pkgname/" release/linux-unpacked/resources/app.asar
	cp -a release/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/$_pkgname/"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE.txt
	install -Dm0644 src/assets/linux/app_icon.png "$pkgdir/usr/share/icons/$_pkgname.png"
	install -Dm0755 "$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/$_pkgname.desktop"

}

pkgver() {
  cd 'desktop'
  echo -e "$(cat package.json | jq '.version' | sed 's/\"//' | sed 's/.develop.*//').$(git rev-parse --short HEAD)" | sed 's/v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

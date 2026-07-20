# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=Cyxuan0311
_gitname=PNANA

_appname=${_gitname,,}

pkgname=${_appname}
pkgver=0.0.7
pkgrel=1
pkgdesc="A modern terminal text editor built with FTXUI, inspired by Nano, Micro, and Sublime Text"

_gitversion=v${pkgver}

license=('MIT')
arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}"
url=${_ghurl}

provides=("${_appname}")

makedepends=('git' 'gcc' 'cmake' 'go' 'lua54' 'chafa' 'ftxui' 'libssh2' 'libsixel' 'libvterm' 'libcurl-compat' 'tree-sitter')
depends=('glibc' 'libgcc' 'libstdc++' 'lua54' 'chafa' 'ftxui' 'libssh2' 'libsixel' 'libvterm' 'curl' 'glib2' 'tree-sitter-json' 'tree-sitter-lua' 'tree-sitter' 'tree-sitter-bash' 'tree-sitter-ruby' 'tree-sitter-c' 'tree-sitter-vim' 'tree-sitter-markdown' 'tree-sitter-javascript' 'tree-sitter-rust' 'tree-sitter-python' 'tree-sitter-sql')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz"
		"build.patch")
sha256sums=('57d6b1e381a06362d516bcc7bec9e98d9cdb5b068ec669b2d4aed8d5b7c24a55'
            '3cc8b5a623f420cc3db204beefd5d4f2ee2daa673ec2438f6de3a7ad27c3282c')

prepare() {
	cd "${srcdir}/${_gitname}-${pkgver}/" || exit 1

	git submodule update --init --recursive

	patch -Np1 -i "../build.patch"

	chmod +x "./build.sh"
}

build() {
	cd "${srcdir}/${_gitname}-${pkgver}/" || exit 1

	./build.sh \
		BUILD_IMAGE_PROTOCOL=ON \
		BUILD_IMAGE_PREVIEW=ON \
		BUILD_ICON_SUPPORT=ON \
		BUILD_TREE_SITTER=ON \
		BUILD_AI_CLIENT=ON \
		BUILD_SSH_MODE=CPP \
		BUILD_LIBVTERM=ON \
		BUILD_LUA=ON
}

package() {
	cd "${srcdir}/${_gitname}-${pkgver}/" || exit 1

	install -Dm755 "build/${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "build/default_config.json" "${pkgdir}/usr/share/${pkgname}/default_config.json"
	install -Dm644 "build/default_tool_paths.json" "${pkgdir}/usr/share/${pkgname}/default_tool_paths.json"

	cp -rf "build/plugins" "${pkgdir}/usr/share/${pkgname}/"

	install -Dm644 "QUICKSTART.md" "${pkgdir}/usr/share/doc/${pkgname}/QUICKSTART.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
	install -Dm644 "RELEASE.md" "${pkgdir}/usr/share/doc/${pkgname}/RELEASE.md"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

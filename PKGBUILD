# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=NSPC911
_gitname=rovr
_appname=${_gitname}
pkgname=${_appname}-nightly-bin
pkgdesc="A post-modern terminal file explorer"

pkgver=0.9.2.0.20260626.965993a
pkgrel=1
_gitversion=nightly

arch=('x86_64' 'aarch64')
_barch=('linux-x64-nuitka' 'linux-arm64-nuitka')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}"{,-bin})

makedepends=('unzip' 'github-cli')
depends=('bash' 'glibc' 'libgcc' 'libstdc++' 'zlib')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.zip")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.zip")
sha256sums=('7e331c8d7ad76b984c11c23de3b860e9f93cae4bad82c264475788a5fc6866ac'
            'b1f7cd544c998e25bcc990abc8c1f7c46d01b3a2ec61efb454ea932cbcc69445')
sha256sums_x86_64=('c9529828d16612292cfb16a98e907072d9dd768e98b69eea4fcfda77bac013f6')
sha256sums_aarch64=('e6c7bfbe98b8c1e4ef5880f945806db89f80431e5eff8149f5bb02d293edb0a2')


pkgver() {
	cd "${srcdir}/" || exit

	read -r _ VERSION COMMIT_HASH <<< "$(echo "$(./${_appname} --version)" | tr -d '()')"

	echo "$(echo ${VERSION} | awk -F'.post' '{print $1 "." ($2 ? $2 : "0")}').$(gh api repos/${_gitauthor}/${_gitname}/commits/${COMMIT_HASH} --jq '.commit.author.date' | cut -d'T' -f1 | tr -d '-').${COMMIT_HASH}"
}

package() {
	cd "${srcdir}/" || exit

	install -dm755 "${pkgdir}/opt/${_appname}"

	find . -mindepth 1 -maxdepth 1 ! -type l -exec mv -t "${pkgdir}/opt/${_appname}" {} +

	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_appname}" << END
#!/usr/bin/env sh
exec /opt/${_appname}/${_appname} "\$@"
END

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

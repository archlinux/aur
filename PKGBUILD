# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=NSPC911
_gitname=rovr
_appname=${_gitname}
pkgname=${_appname}-nightly-bin
pkgdesc="A post-modern terminal file explorer"

pkgver=0.10.0rc1.0.20260726.0ab948e
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
sha256sums_x86_64=('2bc3800654cb6ced786f30cdb17195711e61ca497e8320fc4ac695ecfaec1ac2')
sha256sums_aarch64=('c1f50fa5c53ccc8ef0a83b39886309483711a70bae8e0e90251d7a920191588c')


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

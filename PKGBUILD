# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=derekbsnider
_gitname=madc
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A self-contained C/C++ language with built-in compiler/linker, JIT, AOT and an interactive REPL"

pkgver=0.106.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MPL-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'zstd' 'zlib' 'pcre2' 'webkitgtk-6.0')

options=('!strip' 'staticlibs')

source=("USAGE-${pkgver}.md::${_ghurlraw}/docs/usage.md"
		"README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums=('0437e62763864e95d8916e8bc3ed31dc88b1ad7127963c65dfdf1fec690bc5b5'
            '2ff474c6c5bf06e19ef9c3fe02f78377b26f01d5d8afae224465a0d0960a82d3'
            '1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5')
sha256sums_x86_64=('27072ef2f1c3152dff188d1d22e783d2d07cd0b92349bf7469b8420053c2ea14')


case ${CARCH} in
	${arch[0]})
		_CARCH=${_barch[0]}
	;;
esac

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "bin/${_appname}" -t "${pkgdir}/usr/bin/"

	install -dm755 "${pkgdir}/usr/lib"
	cp -rfa "lib/"* "${pkgdir}/usr/lib/"

	install -Dm644 /dev/stdin "${pkgdir}/etc/apparmor.d/${_appname}" <<EOF
# madc's windows are WebKitGTK, whose sandbox (bwrap) needs user namespaces.
# This profile allows everything else, as before; it only names the
# program so AppArmor grants them.

abi <abi/4.0>,
include <tunables/global>

profile ${_appname} /usr/bin/${_appname} flags=(unconfined) {
  userns,

  # Site-specific additions and overrides. See local/README for details.
  include if exists <local/${_appname}>
}
EOF

	install -Dm644 "share/man/man1/${_appname}.1.gz" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "share/doc/${_appname}/examples/${_appname}.ini" "${pkgdir}/usr/share/doc/${pkgname}/config/${_appname}.example.ini"

	install -Dm644 "../USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "../README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "../LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

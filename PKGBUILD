# Maintainer: Merlijn Verstraete <toxicmushroom + aur A_ melijn · com>

pkgname=verifast-nightly-bin
_pkgname=verifast
pkgdesc="Research prototype tool for modular formal verification of C and Java programs"
arch=("any")
url="https://github.com/verifast/verifast"

# 25.02
_version=$(curl -sI https://github.com/verifast/verifast/releases/latest | tr -d '\r' | sed -En 's/^location: https:\/\/github\.com\/verifast\/verifast\/releases\/tag\/(.*)/\1/p') 

# /verifast/verifast/releases/download/nightly/verifast-24.08.30-147-g6a791d31-linux.tar.gz
_rel_nightly_bin=$(curl -s https://github.com/verifast/verifast/releases/expanded_assets/nightly | grep -oh -E "/verifast/verifast/releases/download/nightly/.*-linux.tar.gz") 

# verifast-24.08.30-147-g6a791d31
_untarred_name=$(echo ${_rel_nightly_bin} | sed -En 's/^\/verifast\/verifast\/releases\/download\/nightly\/(.*)\-linux\.tar\.gz/\1/p')

# 6a791d31
_commit=$(echo ${_rel_nightly_bin} | sed -En 's/^\/verifast\/.*\-g(.*)\-linux\.tar\.gz/\1/p') 

pkgver=25.02.gd74e7b10
pkgrel=1

pkgver() {
  printf "%s.g%s" ${_version} ${_commit}
}

license=('MIT')
depends=(gtk2)
conflicts=(verifast-bin)

source=("https://github.com${_rel_nightly_bin}" "https://raw.githubusercontent.com/verifast/verifast/nightly/LICENSE.md")
sha256sums=("SKIP" "309c4afede6331d0b813e5f0e850d6b638370a70dd31fa2fbf5e40bc5421b49f")

prepare() {
    # idk what the proper way to do this is, this feels wrong
    cp ../$_pkgname.desktop $_pkgname.desktop
    cp ../icon.png icon.png
}

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -d "${pkgdir}/opt"

	install -m644 "${srcdir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	_destdir="/opt/${_pkgname}"
	destdir="${pkgdir}${_destdir}"
	cp -r "${srcdir}/${_untarred_name}" "${destdir}"

    install -d "$pkgdir"/usr/share/applications
    install -m644 "${srcdir}/icon.png" "${destdir}/icon.png"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	
    ln -s "${_destdir}/bin/verifast" "${pkgdir}/usr/bin/verifast"
	ln -s "${_destdir}/bin/vfide" "${pkgdir}/usr/bin/vfide"
	ln -s "${_destdir}/bin/vfide" "${pkgdir}/usr/bin/verifast-ide"
}

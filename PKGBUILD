# Maintainer: Flammkuchen <aur at bbirkner dot de>

pkgname=thunderbird-extension-import-export-tools-ng
_pkgname=import-export-tools-ng
_commit=b662eb03bdb57479c85cef56a1267c04864790f8
pkgver=14.1.18
pkgrel=2
pkgdesc="Thunderbird extension that adds import and export functions for messages, folders and profiles."
arch=('any')
url='https://addons.thunderbird.net/addon/importexporttools-ng/'
license=('GPL-3.0-or-later')
makedepends=('p7zip' 'jq' 'git')
source=("${_pkgname}-${pkgver}"::"git+https://github.com/thunderbird/${_pkgname}#commit=${_commit}")
sha256sums=('3e6c813c1db7ed6912f34556367fa0021204ca9de85bf1e928a9d27867ca4182')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    7z a ./xpi/${_pkgname}-${pkgver}-tb.xpi ./src/*
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    _minVersion=$(jq -r '.applications.gecko.strict_min_version' src/manifest.json)
    _maxVersion=$(jq -r '.applications.gecko.strict_max_version' src/manifest.json | sed 's/\.\*//' )
    depends=("thunderbird>=$_minVersion" "thunderbird<$(($_maxVersion + 1))")

    _archivefilename=$(jq -r '.applications.gecko.id ' src/manifest.json)
    install -D -m644 "xpi/${_pkgname}-${pkgver}-tb.xpi" "${pkgdir}/usr/lib/thunderbird/extensions/${_archivefilename}.xpi"
}

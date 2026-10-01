# Maintainer: Flammkuchen <aur at bbirkner dot de>

pkgname=thunderbird-extension-import-export-tools-ng
_pkgname=import-export-tools-ng
pkgver=15.0.3
pkgrel=1
pkgdesc="Thunderbird extension that adds import and export functions for messages, folders and profiles."
arch=('any')
url='https://addons.thunderbird.net/addon/importexporttools-ng/'
license=('GPL-3.0-or-later')
makedepends=('p7zip' 'jq' 'git')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/thunderbird/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cd70bb4a0959af430fe4a197ca6b036a05870643cd7d5472bf340193b4a2f5ab')

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

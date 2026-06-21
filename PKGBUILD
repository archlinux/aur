# Maintainer: Flammkuchen <aur at bbirkner dot de>

pkgname=thunderbird-extension-import-export-tools-ng
_pkgname=import-export-tools-ng
pkgver=15.0.0
pkgrel=2
pkgdesc="Thunderbird extension that adds import and export functions for messages, folders and profiles."
arch=('any')
url='https://addons.thunderbird.net/addon/importexporttools-ng/'
license=('GPL-3.0-or-later')
makedepends=('p7zip' 'jq' 'git')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/thunderbird/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9a335a4952c0fd2164be69e373cbf3a52a1950fc8101f2009d7fc44132ac0d4b')

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

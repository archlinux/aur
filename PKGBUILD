# Maintainer: Berrit Birkner <aur at bbirkner dot de>

pkgname=thunderbird-extension-cardbook-git
pkgver=102.6.r4739.d26ed34
pkgrel=1
pkgdesc="A new Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/CardBook/CardBook'
license=('MPL-2.0')
makedepends=('jq' 'git')
conflicts=('thunderbird-extension-cardbook')
provides=('thunderbird-extension-cardbook')
source=("CardBook"::"git+${url}.git#branch=Thunderbird-128#branch=Thunderbird-128")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/CardBook"
    printf "%s.r%s.%s" $(jq -r '.version' manifest.json) "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {
    cd "${srcdir}/CardBook"
    export _archivefilename=$(jq -r '.applications.gecko.id' manifest.json)
    bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.js manifest.json background.html LICENSE.txt policy.md
}

package() {
    cd "${srcdir}/CardBook"
    _minVersion=$(jq -r '.applications.gecko.strict_min_version' manifest.json)
    _maxVersion=$(jq -r '.applications.gecko.strict_max_version' manifest.json | sed 's/\.\*//' )
    depends=("thunderbird>=$_minVersion" "thunderbird<$(($_maxVersion + 1))")
    install -D -m644 "${srcdir}/${_archivefilename}.zip" ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}

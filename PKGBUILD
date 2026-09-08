# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=thunderbird-extension-cardbook
pkgver=106.3
_commit=05806953ad5f7a888c85feb26d6031e87ef31a8d
pkgrel=1
pkgdesc="A new Thunderbird address book based on the CardDAV and vCard standards"
arch=('any')
url='https://gitlab.com/cardbook/cardbook'
license=('MPL-2.0')
depends=('thunderbird')
conflicts=('thunderbird<128' 'thunderbird>=156')
source=("${url}/-/archive/${_commit}/${pkgname#thunderbird-extension-}-${pkgver}.tar.gz"
        adjust-compatible-tb-versions.patch
        tweak-js-source-file.patch)
sha256sums=('b1cd055fae436a19609156fd06719ceee7428b8dec40eb847625019974832c2e'
            '4e6fdf6de32c9cbfadf6339bb5221f2b7a1eb2b54a3d72c76fede16ed5adf945'
            '6e81111733732161592db723976f79b441d71b55636c61825f1ae3f49b6e4bd1')

prepare() {
    cd CardBook-${_commit}
    for p in "${srcdir}"/*.patch
    do
        echo "Applying patch $(basename "${srcdir}"/${p})"
        patch -p1 -i "${p}"
    done
}

build() {
    cd CardBook-${_commit}
    export _archivefilename=$(grep '"id"' manifest.json | awk -F \" '{print $4}')
    bsdtar -caf ${srcdir}/$_archivefilename.zip chrome _locales background.html background.js LICENSE manifest.json policy.md README.md VENDOR.md
}

package() {
    install -D -m644 $_archivefilename.zip ${pkgdir}/usr/lib/thunderbird/extensions/$_archivefilename.xpi
}

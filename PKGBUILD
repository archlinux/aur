# Maintainer: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=thinkpad-l860-gl-fcc-unlock-bin

# I do not know how lenovo intends on versioning this, hopefully it's sane
pkgver=1.0
pkgrel=2

pkgdesc='FCC Unlocking tool for the L860-GL/L860R+ in X1 Carbon Gen 10/11 and X1 Yoga Gen 7/8'
arch=('x86_64')
license=('custom:Lenovo License Agreement' MIT custom:BSD3)

# check for new updates from:
# https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-carbon-10th-gen-type-21cb-21cc/downloads/driver-list/component?name=Networking%3A%20Wireless%20WAN&id=49B19606-BEF8-41DD-BE7F-95B570C212C8
url='https://download.lenovo.com/pccbbs/mobiles'

makedepends=()
depends=('dmidecode')
conflicts=()
source=("${url}/n3xwp01w.zip"
        "${url}/n3xwp01w.txt")

sha256sums=('37f474848472d40a7998aaeabe81716766caa97cfef699f663f1f2a086b7de49'
            '21cd4f78e06aef814a783e7434d592af357551ca42d6b33d220129e2e892d152')

install=$pkgname.install

prepare() {
    tar xf lenovo_wwan_fccunlock_package_release_1.0.tar.gz
}

# modified from fcc_unlock_setup.sh
package() {
    _srcdir=lenovo_wwan_fccunlock_package_release_ver1

    ### Copy fcc unlock script for MM
    install -Dm755 "$_srcdir/fcc-unlock.d/8086:7560" -t "$pkgdir/usr/lib/ModemManager/fcc-unlock.d/"

    ### Copy FCC Unlock binary
    install -Dm755 "$_srcdir/DPR_Fcc_unlock_service" -t "$pkgdir/opt/fcc_lenovo/"
    install -Dm755 "$_srcdir/configservice_lenovo" -t "$pkgdir/opt/fcc_lenovo/"

    ### Copy libraries
    install -Dm755 "$_srcdir/libmodemauth.so" -t "$pkgdir/usr/lib/"

    ## copy and enable service
    install -Dm644 "$_srcdir/lenovo-cfgservice.service" -t "$pkgdir/usr/lib/systemd/system/"

    # package license
    install -Dm644 "$_srcdir/Lenovo EULA.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
    install -Dm644 "$_srcdir/ThirdPartyNotice.txt" "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyLicense.txt"

    ### This package will not enable lenovo-cfgservice by default as that's not the arch way.
    ### Please enable this service if you want it to work :)
}

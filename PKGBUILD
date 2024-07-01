# Maintainer: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=thinkpad-l860-gl-fcc-unlock-bin

# I do not know how lenovo intends on versioning this, hopefully it's sane
pkgver=3.1
pkgrel=1

pkgdesc='FCC Unlocking tool for the L860-GL/L860R+ in X1 Carbon Gen 10/11 and X1 Yoga Gen 7/8'
arch=('x86_64')
license=('custom:Lenovo License Agreement' MIT custom:BSD3)

# check for new updates from:
# https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-carbon-10th-gen-type-21cb-21cc/downloads/driver-list/component?name=Networking%3A%20Wireless%20WAN&id=49B19606-BEF8-41DD-BE7F-95B570C212C8
url='https://download.lenovo.com/pccbbs/mobiles'

makedepends=()
depends=('dmidecode')
conflicts=()
source=("${url}/n3xwp04w.zip"
        "${url}/n3xwp04w.txt")

sha256sums=('e9be190c46a49ae47c14d59bdc0450e6541e93fa5a0243d9cb3c0affc6a6ee0e'
            'e39144d17cc81146d024687be55819dba1a875352f06b5b1c7e7103fe5981ffb')

install=$pkgname.install

prepare() {
    tar xf lenovo-wwan-unlock_ver2.1.tar.gz
}

# modified from fcc_unlock_setup.sh
package() {
    _srcdir=lenovo-wwan-unlock

    ### Copy fcc unlock script for MM
    tar -zxf "$_srcdir/fcc-unlock.d.tar.gz" -C $_srcdir/
    install -Dm755 "$_srcdir/fcc-unlock.d/8086:7560" -t "$pkgdir/usr/lib/ModemManager/fcc-unlock.d/"
    install -Dm755 "$_srcdir/fcc-unlock.d/14c3:4d75" -t "$pkgdir/usr/lib/ModemManager/fcc-unlock.d/"
    install -Dm755 "$_srcdir/fcc-unlock.d/1eac:100d" -t "$pkgdir/usr/lib/ModemManager/fcc-unlock.d/"
    install -Dm755 "$_srcdir/fcc-unlock.d/1eac:1007" -t "$pkgdir/usr/lib/ModemManager/fcc-unlock.d/"
    install -Dm755 "$_srcdir/fcc-unlock.d/2c7c:6008" -t "$pkgdir/usr/lib/ModemManager/fcc-unlock.d/"

    ### Copy FCC Unlock binary
    install -Dm755 "$_srcdir/DPR_Fcc_unlock_service" -t "$pkgdir/opt/fcc_lenovo/"
    install -Dm755 "$_srcdir/configservice_lenovo"   -t "$pkgdir/opt/fcc_lenovo/"

    ### Copy SAR config files
    tar -zxf "$_srcdir/sar_config_files.tar.gz" -C "$pkgdir/opt/fcc_lenovo/"

    ### Copy libraries
    install -Dm755 "$_srcdir/libmodemauth.so"        -t "$pkgdir/usr/lib/"
    install -Dm755 "$_srcdir/libconfigserviceR+.so"  -t "$pkgdir/usr/lib/"
    install -Dm755 "$_srcdir/libconfigservice350.so" -t "$pkgdir/usr/lib/"
    install -Dm755 "$_srcdir/libmbimtools.so"        -t "$pkgdir/usr/lib/"

    ## copy and enable service
    install -Dm644 "$_srcdir/lenovo-cfgservice.service" -t "$pkgdir/usr/lib/systemd/system/"

    # package license
    install -Dm644 "$_srcdir/Lenovo Licence Agreement.pdf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
    install -Dm644 "$_srcdir/ThirdPartyNotice.txt"         "$pkgdir/usr/share/licenses/$pkgname/ThirdPartyLicense.txt"

    ### This package will not enable lenovo-cfgservice by default as that's not the arch way.
    ### Please enable this service if you want it to work :)
}

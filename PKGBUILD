# Maintainer: Erwin Iosef <erwiniosef@gmail.com>
# PKGBUILD adapted from islawalker

pkgname=libfprint-focaltech
pkgver=20250714
_filename1=libfprint-2-2_1.94.4+tod1-0ubuntu1~22.04.2_amd64_${pkgver}.deb
_filename2=libfprint-2-2_1.94.4%2Btod1_redhat_all_x64_${pkgver}.install
pkgrel=2
pkgdesc="Proprietary driver for the Focaltech fingerprint reader, support with vid:0x2808, pid: 0x9338, 0xd979, 0xc652, 0xa959, 0x0579"
arch=('x86_64')
url="https://github.com/ftfpteams/focaltech-linux-fingerprint-driver"
depends=('gcc-libs' 'glibc' 'glib2>=2.56' 'libgudev' 'libgusb>=0.3.0'
	 'nss>=3.13.4' 'openssl' 'pixman>=0.30.0')
makedepends=('tar')
conflicts=('libfprint')
provides=('libfprint-2.so' 'libfprint')
options=('!strip' '!emptydirs')
groups=('fprint')
source=("https://github.com/ftfpteams/focaltech-linux-fingerprint-driver/raw/refs/heads/main/Ubuntu_Debian/x86/${_filename1}"
	"https://github.com/ftfpteams/focaltech-linux-fingerprint-driver/raw/refs/heads/main/Fedora_Redhat/${_filename2}")
sha512sums=('7e51e26b2093e342f760e91a070ceaa4fbb9eb91b512ab76cb4dcc3a62dd7bf107f95713b48a2a743a3d6079b1505a91e25aee4e6a58a3db0e0771f42ff054fe'
            'c3d636070202cdcf8b2c204dc35befe26f4f1b3d9796db8a1042f7134bc15dde666fd382a6135110e4830515c1d2c14285968d0acab9e7e129f6e452dfa6fe8e')
license=('custom')

prepare() {
    cd "$srcdir"
    # Extract the deb file
    ar x "${_filename1}"
    # Extract data archive
    tar -xf data.tar.*

    #Extract Fedora.install file
    sed "1,/^main \$@/d" "${_filename2}" > libfprint.tar.gz
    tar -xvf libfprint.tar.gz  usr/lib64/libfprint-2.so.2.0.0

#Adjust udev rules for Arch (replace plugdev with uaccess, rm unnecessary ATTRS{dev}, tested, works after rm)
#adapted from libfprint-2-tod1-goodix-v2(MLM-stuff)

    if [ -f "lib/udev/rules.d/60-libfprint-2.rules" ]; then
        sed -i 's/, ATTRS{dev}=="\*"//' lib/udev/rules.d/60-libfprint-2.rules
        sed -i 's/GROUP="plugdev"/TAG+="uaccess"/' lib/udev/rules.d/60-libfprint-2.rules
    fi
}

package() {
    cd "$srcdir"
    # Install library files
    install -Dm755 "usr/lib64/libfprint-2.so.2.0.0" -t "${pkgdir}/usr/lib/"

    cd "${pkgdir}/usr/lib"
    ln -s libfprint-2.so.2.0.0 libfprint-2.so.2
    ln -s libfprint-2.so.2.0.0 libfprint-2.so

    cd "$srcdir"
    # Install udev rules
    if [ -d "lib/udev/rules.d" ]; then
        install -Dm644 lib/udev/rules.d/*.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
    fi
    # Install license if present
    if [ -f "usr/share/doc/${_filename1%%_1*}/copyright" ]; then
        install -Dm644 "usr/share/doc/${_filename1%%_1*}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}


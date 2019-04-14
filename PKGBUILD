# Maintainer: robertfoster
# Contributor: abozanich

pkg=linux-sgx-driver
pkgname=$pkg-dkms-git
pkgver=2.5
pkgrel=1
pkgdesc="Intel® SGX Linux module - dkms"
arch=('i686' 'x86_64')
url="https://01.org/intel-softwareguard-extensions"
license=('GPL2')
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel'
'linux-lts-headers: Build the module for LTS Arch kernel')
source=("$pkg::git+https://github.com/01org/linux-sgx-driver.git"
dkms.conf)

pkgver() {
    cd $srcdir/$pkg
    git describe --tags | cut -c 12-
}

package() {
    installDir="$pkgdir/usr/src/$pkg-$pkgver"

    install -dm755 "$installDir"

    # Copy dkms .conf
    install -Dm644 ../dkms.conf "$installDir/dkms.conf"

    # Set name and version
    sed -e "s/@PKG@/${pkg}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "$installDir/dkms.conf"

    # Copy sources
    cd $srcdir/$pkg

    for d in `find . -type d`
    do
        install -dm755  "${installDir}/$d"
    done
    for f in `find . -type f ! -name 'README.md' ! -name '.gitignore'`
    do
        install -m644 "$f" "${installDir}/$f"
    done

    sed -e "s/-O0//" \
        -i "$installDir/Makefile"
}

md5sums=('SKIP'
'620201f62a773287ddfa6e9b0ffde1f8')

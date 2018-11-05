# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=vagrant-libvirt
pkgver=0.0.45
pkgrel=1
_foglibvirtver=0.5.0
_fogcorever=1.43.0
_libvirtver=0.7.1
pkgdesc="libvirt provider plugin for Vagrant"
arch=(i686 x86_64)
url="https://github.com/vagrant-libvirt/vagrant-libvirt"
license=("MIT")
depends=("vagrant" "libvirt" "openssl-1.0")
makedepends=("git")
# "https://rubygems.org/downloads/vagrant-libvirt-$pkgver.gem"
source=("https://github.com/vagrant-libvirt/vagrant-libvirt/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://rubygems.org/downloads/ruby-libvirt-$_libvirtver.gem"
        "https://rubygems.org/downloads/fog-core-$_fogcorever.gem"
        "https://rubygems.org/downloads/fog-libvirt-$_foglibvirtver.gem")
noextract=("fog-libvirt-$_foglibvirtver.gem"
           "fog-core-$_fogcorever.gem"
           "ruby-libvirt-$_libvirtver.gem"
           "vagrant-libvirt-$pkgver.gem")
sha256sums=('c504a081603be24550cc07671e384f1b7ba3b5507286ce5379458120652b3b01'
            '46ad7bb823b1c8865fa9967c9bdc1e76078c460717267a45c11eb7774d23e534'
            '866b816e7516d6787bc074fcec8bb530ebf196685fee03cf56a69ecd852e8229'
            '6e2e21c37526d7e4ccd94d225a3ebfdc976e3296051e4579383d9426f533613e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # patch -p1 -i "$srcdir/nokogiri-version.patch"
    git init
    git add .
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    EMBEDDED_DIR=/opt/vagrant/embedded
    export GEM_PATH="$EMBEDDED_DIR"/gems

    GEM_HOME="$GEM_PATH" \
    GEMRC="$EMBEDDED_DIR"/etc/gemrc \
        gem build vagrant-libvirt.gemspec
}

package() {
    cd "$srcdir"
    mv "$pkgname-$pkgver/$pkgname-$pkgver.gem" .

    EMBEDDED_DIR=/opt/vagrant/embedded
    export GEM_PATH="$EMBEDDED_DIR"/gems

    for gem in "${noextract[@]}"; do
        GEM_HOME="$GEM_PATH" \
        GEMRC="$EMBEDDED_DIR"/etc/gemrc \
            gem install --ignore-dependencies --no-user-install -N -i "$pkgdir$GEM_PATH" "$gem"
    done
}

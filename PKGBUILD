# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=vagrant-libvirt
pkgver=0.1.2
pkgrel=1
_foglibvirtver=0.7.0
_fogcorever=2.2.0
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
sha256sums=('d8cd651225b0332da6ce744e2cb77d52676eeb5139544caecae94185e02b4d98'
            '46ad7bb823b1c8865fa9967c9bdc1e76078c460717267a45c11eb7774d23e534'
            '3d6930b6cda7ab3523e0f73eb1043034d483761204bfe2e3e45012bc32ed32e8'
            'f971b7014bb51d0197d37b2f9ea12ffe4f214ddfd801dfe621bf7d0dfa3ac92f')

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

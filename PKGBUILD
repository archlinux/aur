# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=vagrant-libvirt
pkgver=0.7.0
pkgrel=1
_foglibvirtver=0.9.0
_fogcorever=2.2.4
_libvirtver=0.7.1
pkgdesc="libvirt provider plugin for Vagrant"
arch=(i686 x86_64)
url="https://github.com/vagrant-libvirt/vagrant-libvirt"
license=("MIT")
depends=("vagrant" "libvirt" "openssl-1.0")
makedepends=("git" "ruby")
install=$pkgname.install
# "https://rubygems.org/downloads/vagrant-libvirt-$pkgver.gem"
source=("https://github.com/vagrant-libvirt/vagrant-libvirt/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "https://rubygems.org/downloads/ruby-libvirt-$_libvirtver.gem"
        "https://rubygems.org/downloads/fog-core-$_fogcorever.gem"
        "https://rubygems.org/downloads/fog-libvirt-$_foglibvirtver.gem")
noextract=("fog-libvirt-$_foglibvirtver.gem"
           "fog-core-$_fogcorever.gem"
           "ruby-libvirt-$_libvirtver.gem"
           "vagrant-libvirt-$pkgver.gem")
sha256sums=('1bda9e15d7cab52e7d562759f66b7a6e8ea16572307526dcc9abab0703da278f'
            '46ad7bb823b1c8865fa9967c9bdc1e76078c460717267a45c11eb7774d23e534'
            '0f03d08dcc7f03434c4d61d591dac6e45175d2f7262ac1fd56cd67ff6f99bf50'
            '8dd23b5e04883e6732cc97eaac5f44f1fd7fb3cb16c051b4cc5e72a9f41a0be9')

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
    export CFLAGS="-I/usr/include/ruby-3.0.0/ruby"

    for gem in "${noextract[@]}"; do
        GEM_HOME="$GEM_PATH" \
        GEMRC="$EMBEDDED_DIR"/etc/gemrc \
            gem install --ignore-dependencies --no-user-install -N -i "$pkgdir$GEM_PATH" "$gem"
    done
}

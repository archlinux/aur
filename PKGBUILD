# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=vagrant-libvirt
pkgver=0.0.43
pkgrel=1
_foglibvirtver=0.4.2
_fogcorever=1.43.0
_libvirtver=0.7.0
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
sha256sums=('af1c0bcf29777aa23590c2627ce83a28e16f5cdfa5a19c66415049c903a5873a'
            '61f1261500dd18ea42452a7a69dce8606057e9c1143d1224201d8c29db0bc703'
            '866b816e7516d6787bc074fcec8bb530ebf196685fee03cf56a69ecd852e8229'
            'b08b05742188c7c89062fbf3874c37355ea71562fd9d3028a2279e9d2d227736')

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
    mv $pkgname-$pkgver/$pkgname-$pkgver.gem .

    EMBEDDED_DIR=/opt/vagrant/embedded
    export GEM_PATH="$EMBEDDED_DIR"/gems

    for gem in "${noextract[@]}"; do
        GEM_HOME="$GEM_PATH" \
        GEMRC="$EMBEDDED_DIR"/etc/gemrc \
            gem install --ignore-dependencies --no-user-install -N -i "$pkgdir$GEM_PATH" $gem
    done
}

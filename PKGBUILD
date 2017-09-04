# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=vagrant-libvirt
pkgver=0.0.40
pkgrel=7
_foglibvirtver=0.3.0
_fogcorever=1.43.0
_fogjsonver=1.0.2
_fogxmlver=0.1.2
_libvirtver=0.7.0
_exconver=0.54.0
_formatadorver=0.2.5
pkgdesc="libvirt provider plugin for Vagrant"
arch=(i686 x86_64)
url="https://github.com/vagrant-libvirt/vagrant-libvirt"
license=("MIT")
depends=("vagrant" "libvirt" "openssl-1.0")
makedepends=("git" "chrpath")
# "https://rubygems.org/downloads/vagrant-libvirt-$pkgver.gem"
source=("https://github.com/vagrant-libvirt/vagrant-libvirt/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "nokogiri-version.patch"
        "https://rubygems.org/downloads/ruby-libvirt-$_libvirtver.gem"
        "https://rubygems.org/downloads/fog-core-$_fogcorever.gem"
        "https://rubygems.org/downloads/fog-libvirt-$_foglibvirtver.gem"
        "https://rubygems.org/downloads/fog-json-$_fogjsonver.gem"
        "https://rubygems.org/downloads/fog-xml-$_fogxmlver.gem"
        "https://rubygems.org/downloads/excon-$_exconver.gem"
        "https://rubygems.org/downloads/formatador-$_formatadorver.gem")
noextract=("formatador-$_formatadorver.gem"
           "excon-$_exconver.gem"
           "fog-xml-$_fogxmlver.gem"
           "fog-json-$_fogjsonver.gem"
           "fog-libvirt-$_foglibvirtver.gem"
           "fog-core-$_fogcorever.gem"
           "ruby-libvirt-$_libvirtver.gem"
           "vagrant-libvirt-$pkgver.gem")
sha256sums=('9baba0c338c89acd9d0e594467ba9c8eef1d07039bb6da4a11e432e934b288a3'
            '6fde2ec924f84ad5d3b8846d54d9dfd66215d1a10a7383672ee34d5dd78ed8f5'
            '61f1261500dd18ea42452a7a69dce8606057e9c1143d1224201d8c29db0bc703'
            '866b816e7516d6787bc074fcec8bb530ebf196685fee03cf56a69ecd852e8229'
            '079bf3f4b03c6cde89d88256fed06c855680eba614ff8cf4674e033414031191'
            '19006b42ac58cc71442e97d00de454824245b3780bb091cfa97e4a25db9cbb29'
            '0a3b624ae6503d167a1fdfb5d0da669b3d98c7e301a6092e22ff10f5ffd2e694'
            'a32d6e509dd99b9b201c4d3a50b08e4ea7279dfc99bc05332799a00d92368b48'
            '80821869ddacb79e72870ff4bb1531efacd278c04f2df26bc6b4529ee13582bd')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir/nokogiri-version.patch"
    git init
    git add .
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    /opt/vagrant/embedded/bin/gem build vagrant-libvirt.gemspec
}

package() {
    cd "$srcdir"
    mv $pkgname-$pkgver/$pkgname-$pkgver.gem .

    local GEM_HOME=/opt/vagrant/embedded/gems

    export CFLAGS="$CFLAGS -DHAVE_VIRNETWORKGETDHCPLEASES -DHAVE_VIRDOMAINMANAGEDSAVE -DHAVE_VIRDOMAINATTACHDEVICEFLAGS -DHAVE_VIRDOMAINISACTIVE -DHAVE_VIRNETWORKISACTIVE -DHAVE_VIRSTORAGEPOOLISPERSISTENT -DHAVE_VIRSTORAGEPOOLISACTIVE -DHAVE_VIRSTORAGEVOLDOWNLOAD -DHAVE_VIRDOMAINGETVCPUPININFO"

    for gem in ${noextract[@]}; do
        CONFIGURE_ARGS="with-ldflags='-L/opt/vagrant/embedded/lib -l:libruby.so.2.3' with-libvirt-include=/usr/include with-libvirt-lib=/usr/lib" \
        GEM_HOME=$GEM_HOME \
        GEM_PATH=$GEM_HOME \
        PATH=/opt/vagrant/embedded/bin:$PATH \
        /opt/vagrant/embedded/bin/gem install --ignore-dependencies --no-user-install -N -i "$pkgdir$GEM_HOME" $gem
    done

    cd "$pkgdir"/opt/vagrant/embedded/gems
    chrpath -r /usr/lib:/opt/vagrant/embedded/lib \
      gems/ruby-libvirt-*/lib/_libvirt.so \
      gems/ruby-libvirt-*/ext/libvirt/_libvirt.so \
      extensions/*/*/ruby-libvirt-*/_libvirt.so
}

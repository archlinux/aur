# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Ben Mazer <blm@groknil.org>

pkgname=muine
pkgver=0.8.11
pkgrel=6
pkgdesc="A music player written in C Sharp"
arch=('x86_64')
license=('GPL')
url="http://muine.gooeylinux.org/"
depends=('gst-plugins-base' 'gconf-sharp' 'taglib-sharp' 'notify-sharp')
makedepends=('intltool' 'gnome-common')
optdepends=('gst-plugins-bad: Extra media codecs'
            'gst-plugins-good: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2
        fix-multimedia-key-support.patch
        use-notify-sharp.patch
        fix-overwrite-dialog.patch
        use-dbus-sharp.patch
        drop-gnome-sharp-dependency.patch
        use-standard-icons.patch
        use-gstreamer-1.0.patch
        enable-deprecations.patch
        drop-musicbrainz.patch
        fix-dnd.patch)
sha512sums=('13063c1057cc4a5fb9c2cfca6249e3014415cbfa735a89f1ae411705412e379f1252789787aaca5e11f844fcd8c31a319c408c73539ffe173bc03985b3606d79'
            '61ea7a768192f526ca4466d97a08028de4d98edc93779bf7c896aec5d4d003104916680ab6d3e15476b3caff4bdd9edfa91207a68c9d39d17c39f24b02f94ab4'
            '20adfb1f294e1fadd85b868b4b39400a5e90054f42e1433386d48058aa5892b588244358363bce92b372ae7390cfeefbcef90ea12df977f0939bdb26b44a8222'
            '4b257d8d2fdae7fc4c186f292b0b6327254466840c8f63adc353bd2ffad92ca4e682f949e9762bb2c2653cf0dcbe85d5660be1147bb9d0a70a44cc72495b6738'
            '66063e7ed0f4057031bf82bea3259fdbc6b12e433171f356e721bb3e15b060887a5cfc375963f4a23dd8512618fdf36fa74a72cb7f5296b91706cf7e7e4420de'
            'd9d3b66df45164597fa16fa24ab11226bf9cdcaa05c4d698110da0b3bca0214d070b05f4dd49834f7af2a87bb2ab8730d93251b53c00e0dd224cfd8a58b3a18b'
            '750cc1a5ebfaf172e21502fb119498de504dfcbb243a38cc8cc828082199c594def950faa146ba96b57ba5febb781b309c8e9e029b59e2a06ce85227326adcf9'
            'fe061904b650068845ac61a2b4d621a26b5af8fed202023a76fa9bd994713906559b22cf312e3fe2b0d6512cc0350d21b2a4c9cbc8d7db537ee2eddf4ce9acaa'
            '4d744bb8403ab6d3adca90869e5f97cfa093797397e101a729efa09b731c6b22dcbd336d866cd2d9f9b0648c0b7afff702dbda4d6a51094349b852cc4b511e45'
            '0b9ce09d92da1c8dfb44b15f0b3e340f773bd142662aeea7dd76ef427e063c3ad8db17a2fe8331ee236d1f06a2e4b4d0f8b0e50508423f3e54a923f8bf08c430'
            '6758b90107fd02a667a67da9e0c7a59003d13598f129bd796148e1701be72e8b9e0d0e0eae66b963fa8480c4477c66dc2d056d26615558d5845e9413847761b3')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../fix-multimedia-key-support.patch
  patch -Np1 -i ../use-notify-sharp.patch
  patch -Np1 -i ../fix-overwrite-dialog.patch
  patch -Np1 -i ../use-dbus-sharp.patch
  patch -Np1 -i ../drop-gnome-sharp-dependency.patch
  patch -Np1 -i ../use-standard-icons.patch
  patch -Np1 -i ../use-gstreamer-1.0.patch
  patch -Np1 -i ../enable-deprecations.patch
  patch -Np1 -i ../drop-musicbrainz.patch
  patch -Np1 -i ../fix-dnd.patch
  sed -i 's/MCS, gmcs/MCS, mcs/' configure.in
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --enable-compile-warnings=minimum \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

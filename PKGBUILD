# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=5.1.1
pkgrel=2
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
depends=('gobject-introspection-runtime' 'gtk3' 'ruby-bundler')
makedepends=('gobject-introspection')
optdepends=('alsa-utils: sound notification support'
            'libnotify: notify support')
source=(
https://mikutter.hachune.net/bin/$pkgname-$pkgver.tar.gz
mikutter.desktop
)
sha256sums=('ddff538aae249bd636604128bac1ccb526a4ed5c32f00b45d3c3c1dbcdb655de'
            '698cbd105c91296c92003352e2e66015a6db33ead5ae629a5441fdea7e67607f')
_gemdir="vendor/bundle/ruby/`ruby -e'print Gem.dir.match(/^.+\/(.+?)$/)[1]'`"

build() {
  cd "$pkgname-$pkgver"

  gem install --no-document --no-user-install -i $_gemdir rake
  bundle config --local path "vendor/bundle"
  bundle config --local without "test"

  # Workaround for build failure with gcc 15
  bundle config --local build.gio2 "--with-cflags=-Wno-incompatible-pointer-types"
  bundle config --local build.glib2 "--with-cflags=-Wno-incompatible-pointer-types"
  bundle config --local build.gtk3 "--with-cflags=-Wno-incompatible-pointer-types"
  bundle config --local build.gobject-introspection "--with-cflags=-Wno-incompatible-pointer-types"
  bundle config --local build.pango "--with-cflags=-Wno-incompatible-pointer-types"

  bundle install

  rm -rf $_gemdir/{build_info,cache,doc}
}

package() {
  mkdir "$pkgdir/opt"
  cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  cat <<'EOF' > "$pkgdir/usr/bin/mikutter"
#!/bin/sh
BUNDLE_GEMFILE=/opt/mikutter/Gemfile bundle exec ruby /opt/mikutter/mikutter.rb $@
EOF
  chmod a+x "$pkgdir/usr/bin/mikutter"

  mkdir -p $pkgdir/usr/share/applications
  cp "$srcdir/mikutter.desktop" "$pkgdir/usr/share/applications"
  chmod +x $pkgdir/usr/share/applications/mikutter.desktop
}

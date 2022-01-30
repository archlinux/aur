# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=5.0.4
pkgrel=1
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
depends=('gobject-introspection-runtime' 'gtk3' 'ruby-bundler')
makedepends=('gobject-introspection')
optdepends=('alsa-utils: sound notification support'
            'libnotify: notify support')
source=(
http://mikutter.hachune.net/bin/$pkgname-$pkgver.tar.gz
mikutter.desktop
)
sha256sums=('875a8009241ad312c0bc2be0df9d64461d29410564124f306cf443e316fa1732'
            '698cbd105c91296c92003352e2e66015a6db33ead5ae629a5441fdea7e67607f')
_gemdir="vendor/bundle/ruby/`ruby -e'print Gem.dir.match(/^.+\/(.+?)$/)[1]'`"

build() {
  cd "$pkgname-$pkgver"

  gem install --no-document --no-user-install -i $_gemdir rake
  bundle config --local path "vendor/bundle"
  bundle config --local without "test"
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

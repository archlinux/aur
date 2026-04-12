# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=5.1.2
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
https://mikutter.hachune.net/bin/$pkgname-$pkgver.tar.gz
mikutter.desktop
)
sha256sums=('ac5d5cc386dd03d544d34a2fd2e5c73e38985eb2fcbe98e7137931de04bb6433'
            '698cbd105c91296c92003352e2e66015a6db33ead5ae629a5441fdea7e67607f')
_gemdir="vendor/bundle/ruby/`ruby -e'print Gem.dir.match(/^.+\/(.+?)$/)[1]'`"

build() {
  cd "$pkgname-$pkgver"

  gem install --no-document --no-user-install -i $_gemdir rake
  bundle config --local path "vendor/bundle"
  bundle config --local without "test"

  # Update gtk3 gem to fix build failure with gcc 15
  sed -i "s/gem 'gtk3', '4.2.1'/gem 'gtk3', '4.3.6'/" plugin/gtk3/Gemfile

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

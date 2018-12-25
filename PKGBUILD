# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=3.8.4
pkgrel=1
pkgdesc="a moest twitter client"
arch=('i686' 'x86_64')
url="http://mikutter.hachune.net/"
license=('MIT')
depends=('gobject-introspection-runtime' 'gtk2' 'ruby-bundler')
makedepends=('gobject-introspection')
optdepends=('alsa-utils: sound notification support'
            'libnotify: notify support')
source=(
http://mikutter.hachune.net/bin/$pkgname.$pkgver.tar.gz
mikutter.desktop
config.patch
)
_gemdir="vendor/bundle/ruby/`ruby -e'print Gem.dir.match(/^.+\/(.+?)$/)[1]'`"

prepare() {
  cd "$pkgname"

  patch -p1 < "$srcdir/config.patch"
}

build() {
  cd "$pkgname"

  gem install --no-document --no-user-install -i $_gemdir rake
  bundle install --path vendor/bundle --without test

  tt_ver=`bundle exec gem q -q twitter-text | sed -r 's/^.*\((.*)\)$/\1/'`
  ln -s "/opt/$pkgname/$_gemdir/gems/twitter-text-$tt_ver/config" .

  idn_ver=`bundle exec gem q -q idn-ruby | sed -r 's/^.*\((.*)\)$/\1/'`
  ln -sf "/opt/$pkgname/$_gemdir/gems/idn-ruby-$idn_ver/lib/idn.so" "vendor/idn.so"

  rm -rf $_gemdir/{build_info,cache,doc}
}

package() {
  mkdir "$pkgdir/opt"
  cp -r "$srcdir/$pkgname" "$pkgdir/opt"

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

md5sums=('03327602befe873054014b451d3ee040'
         '3bc1c65e13b6182a9c989835eefc8810'
         '54df9d2f1f19d3c27034cc1a97d1bc67')

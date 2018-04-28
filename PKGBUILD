# vim:set ts=2 sw=2 et:
# Maintainer: Gomasy <nyan@gomasy.jp>
# Contributor: 2GMon <t_2gmon@yahoo.co.jp>

pkgname=mikutter
pkgver=3.6.6
pkgrel=3
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
changeset_r04106332051247a032fa2caea288f4f352d4a60e.diff
)
_gemdir="vendor/bundle/ruby/`ruby -e'print Gem.dir.match(/^.+\/(.+?)$/)[1]'`"

prepare() {
  cd "$pkgname"

  patch -p1 < "$srcdir/changeset_r04106332051247a032fa2caea288f4f352d4a60e.diff"
}

build() {
  cd "$pkgname"
  gem install --no-document --no-user-install -i $_gemdir rake
  bundle install --path vendor/bundle --without test

  _version=`bundle exec gem q -q twitter-text | sed -r 's/^.*\((.*)\)$/\1/'`
  ln -s "/opt/$pkgname/$_gemdir/gems/twitter-text-$_version/config" .

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

md5sums=('c5b4ed6666a3e78674a46f06af139f04'
         '3bc1c65e13b6182a9c989835eefc8810'
         'f86a796af53bc8d09403b451d2b6b995')

# Maintainer: Jonne Haß <me@mrzyx.de>
pkgbase=diaspora
pkgname=('diaspora-mysql' 'diaspora-postgresql')
pkgver=0.5.1.0
pkgrel=1
pkgdesc="A distributed privacy aware social network"
arch=('i686' 'x86_64')
url="http://diasporafoundation.org"
license=('AGPL3')
depends=('ruby2.1' 'ruby2.1-bundler' 'redis' 'imagemagick' 'libxslt' 'net-tools' 'gsfonts')
makedepends=('nodejs' 'postgresql-libs' 'libmysqlclient')
conflicts=('diaspora-git' 'diaspora-mysql-git' 'diaspora-postgresql-git')
options=(!strip)
backup=("etc/webapps/$pkgbase/diaspora.yml"
        "etc/webapps/$pkgbase/database.yml"
        "etc/webapps/$pkgbase/secret_token.rb")
install="$pkgbase.install"
source=("$pkgbase-$pkgver.tar.gz::https://github.com/$pkgbase/$pkgbase/tarball/v$pkgver"
        "$pkgbase.install"
        "$pkgbase.service"
        "$pkgbase.tmpfiles.d.conf"
        "$pkgbase.bashrc"
        "$pkgbase.bash_profile")

# Get rid of any possible ruby version managers
# From https://github.com/postmodern/chruby
_reset_ruby() {
  [[ -z "$RUBY_ROOT" ]] && return

  export PATH=":$PATH:"; export PATH=${PATH//:$RUBY_ROOT\/bin:/:}

  [[ -n "$GEM_HOME" ]] && export PATH=${PATH//:$GEM_HOME\/bin:/:}
  [[ -n "$GEM_ROOT" ]] && export PATH=${PATH//:$GEM_ROOT\/bin:/:}

  export GEM_PATH=":$GEM_PATH:"
  export GEM_PATH=${GEM_PATH//:$GEM_HOME:/:}
  export GEM_PATH=${GEM_PATH//:$GEM_ROOT:/:}
  export GEM_PATH=${GEM_PATH#:}; export GEM_PATH=${GEM_PATH%:}
  unset GEM_ROOT GEM_HOME

  export PATH=${PATH#:}; export PATH=${PATH%:}
  unset RUBY_ROOT RUBY_ENGINE RUBY_VERSION RUBYOPT
}

_package() {
  _bundle=bundle-2.1
  _ruby=ruby-2.1
  _rake=rake-2.1
  _db=$1
  _srcdir=$srcdir/$pkgname-$pkgver

  _reset_ruby

  msg "Setup build directory"
  mkdir -p $_srcdir
  cp -Rf $srcdir/$pkgbase-$pkgbase-*/{app,config,db,public,lib,script,vendor,config.ru,Gemfile,Gemfile.lock,Procfile,Rakefile} $_srcdir

  cd $_srcdir

  msg "Bundle dependencies"
  echo "gem: --no-rdoc --no-ri --no-user-install" > $_srcdir/.gemrc
  HOME=$_srcdir DB=$_db $_bundle config --local build.sigar '--with-cppflags="-fgnu89-inline"'
  HOME=$_srcdir DB=$_db $_bundle install \
    --without development test heroku --path vendor/bundle
  HOME=$_srcdir DB=$_db $_bundle clean

  msg "Patch configuration examples"
  sed -i -e "s|#certificate_authorities: '/etc/ssl/certs/ca-certificates.crt'|certificate_authorities: '/etc/ssl/certs/ca-certificates.crt'|" \
         -e "s|#rails_environment: 'production'|rails_environment: 'production'|" \
         -e "s|#database: 'mysql'|database: '$_db'|" \
      $_srcdir/config/diaspora.yml.example
  sed -i -e "s|<<: \*mysql|<<: *$_db|" \
         -e "s|#<<: \*postgres||" \
      $_srcdir/config/database.yml.example

  cp $_srcdir/config/diaspora.yml{.example,}
  cp $_srcdir/config/database.yml{.example,}

  msg "Create secret token"
  HOME=$_srcdir DB=$_db $_bundle exec $_rake generate:secret_token

  msg "Precompile assets"
  DB=$_db $_bundle exec $_rake assets:precompile

  rm $_srcdir/config/{diaspora,database}.yml

  msg "Copy contents to package directory"
  install -dm755 $pkgdir/usr/share/webapps/$pkgbase
  cp -Rf $_srcdir/* $pkgdir/usr/share/webapps/$pkgbase/
  cp -Rf $_srcdir/.bundle $pkgdir/usr/share/webapps/$pkgbase/
  install -Dm644 $_srcdir/.gemrc $pkgdir/usr/share/webapps/$pkgbase/.gemrc
  install -Dm640 $_srcdir/config/initializers/secret_token.rb $pkgdir/etc/webapps/$pkgbase/secret_token.rb
  install -Dm644 $srcdir/$pkgbase.service $pkgdir/usr/lib/systemd/system/$pkgbase.service
  install -Dm644 $srcdir/$pkgbase.tmpfiles.d.conf $pkgdir/usr/lib/tmpfiles.d/$pkgbase.conf
  install -Dm644 $srcdir/$pkgbase.bashrc  $pkgdir/usr/share/webapps/$pkgbase/.bashrc
  install -Dm644 $srcdir/$pkgbase.bash_profile $pkgdir/usr/share/webapps/$pkgbase/.bash_profile

  msg "Build source.tar.gz to conform the AGPL"
  tar czf $pkgdir/usr/share/webapps/$pkgbase/public/source.tar.gz \
          $pkgdir/usr/share/webapps/$pkgbase/{app,db,lib,script,Gemfile,Gemfile.lock,Rakefile,Procfile,config.ru}

  msg "Symlink ruby and bundle"
  install -dm755          $pkgdir/usr/share/webapps/$pkgbase/bin
  ln -s /usr/bin/$_ruby   $pkgdir/usr/share/webapps/$pkgbase/bin/ruby
  ln -s /usr/bin/$_bundle $pkgdir/usr/share/webapps/$pkgbase/bin/bundle

  msg "Prepare configuration files"
  install -dm750 $pkgdir/etc/webapps/$pkgbase
  install -Dm640 $_srcdir/config/diaspora.yml.example $pkgdir/etc/webapps/$pkgbase/diaspora.yml
  install -Dm640 $_srcdir/config/database.yml.example $pkgdir/etc/webapps/$pkgbase/database.yml

  sed -i -e "s|%db%|$_db|" \
      $pkgdir/usr/share/webapps/$pkgbase/.bashrc
  sed -i -e "s|%db%|$_db|" \
         -e "s|mysql|mysqld|" \
         -e "s|postgres|postgresql|" \
      $pkgdir/usr/lib/systemd/system/$pkgbase.service

  msg "Create symlinks"
  install -dm755 $pkgdir/var/log/$pkgbase
  install -dm755 $pkgdir/var/lib/$pkgbase/uploads
  rm -Rf $pkgdir/usr/share/webapps/$pkgbase/log \
         $pkgdir/usr/share/webapps/$pkgbase/tmp \
         $pkgdir/usr/share/webapps/$pkgbase/public/uploads
  ln -s  /etc/webapps/$pkgbase/diaspora.yml    $pkgdir/usr/share/webapps/$pkgbase/config/diaspora.yml
  ln -s  /etc/webapps/$pkgbase/database.yml    $pkgdir/usr/share/webapps/$pkgbase/config/database.yml
  ln -sf /etc/webapps/$pkgbase/secret_token.rb $pkgdir/usr/share/webapps/$pkgbase/config/initializers/secret_token.rb
  ln -sf /var/lib/$pkgbase/uploads             $pkgdir/usr/share/webapps/$pkgbase/public/uploads
  ln -sf /tmp/$pkgbase                         $pkgdir/usr/share/webapps/$pkgbase/tmp
  ln -sf /var/log/$pkgbase                     $pkgdir/usr/share/webapps/$pkgbase/log
}

package_diaspora-mysql() {
  pkgdesc="$pkgdesc (MySQL)"
  conflicts=(${conflicts[@]} 'diaspora-postgresql')
  depends=(${depends[@]} 'libmysqlclient' 'mysql')

  _package mysql
}

package_diaspora-postgresql() {
  pkgdesc="$pkgdesc (PostgreSQL)"
  conflicts=(${conflicts[@]} 'diaspora-mysql')
  depends=(${depends[@]} 'postgresql-libs' 'postgresql')

  _package postgres
}

sha256sums=('5a40378431ec62c291cc3f9e6c0d0a194ce606bfeb6b2b7965da215c4ea986d9'
            'aae126c4b1bcba6265d3d925dc3845bb034defa5606385c22dfb053111b57685'
            'f1770d7cfa2b3344e697ee664f5ab49e7cdeb50e93230a358a1ab5776824c81b'
            '26ae975338c5ab3fc506bd7bdb13d1b9f853ac0b9d8e591babf63c22a502d3be'
            'a3e17221e8cdbe5a8073f4725960f794c31208b0098177a296356af293b14596'
            '29cfd5116e919d8851ff70b8b82af8d4a6c8243a9d1ca555981a1a695e2d7715')

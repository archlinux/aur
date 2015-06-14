# Maintainer: Jonne Haß <me@mrzyx.de>
pkgbase=diaspora-git
_projectname=diaspora
pkgname=('diaspora-mysql-git' 'diaspora-postgresql-git')
pkgver=0.5.0.1.r380.gb0de392
pkgrel=2
pkgdesc="A distributed privacy aware social network (development head)"
arch=('i686' 'x86_64')
url="http://diasporafoundation.org"
license=('AGPL3')
depends=('ruby' 'ruby-bundler>=1.10' 'redis' 'imagemagick' 'libxslt' 'net-tools' 'gsfonts')
makedepends=('git' 'libmysqlclient' 'postgresql-libs' 'nodejs')
conflicts=('diaspora' 'diaspora-mysql' 'diaspora-postgresql')
options=(!strip)
backup=("etc/webapps/$_projectname/diaspora.yml"
        "etc/webapps/$_projectname/database.yml"
        "etc/webapps/$_projectname/secret_token.rb")
install="$_projectname.install"
source=("git://github.com/$_projectname/$_projectname.git#branch=develop"
        "$_projectname.install"
        "$_projectname.service"
        "$_projectname.tmpfiles.d.conf"
        "$_projectname.bashrc"
        "$_projectname.bash_profile")

pkgver() {
  cd $srcdir/$_projectname
  git describe --long | sed 's/^v//;s/-/.r/; s/-/./'
}

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
  _bundle=bundle
  _ruby=ruby
  _rake=rake
  _db=$1
  _srcdir=$srcdir/$pkgname-$pkgver

  _reset_ruby

  msg "Setup build directory"
  mkdir -p $_srcdir
  cp -Rf $srcdir/$_projectname/{bin,app,config,db,public,lib,script,vendor,config.ru,Gemfile,Gemfile.lock,Procfile,Rakefile} $_srcdir

  cd $_srcdir

  msg "Bundle dependencies"
  echo "gem: --no-rdoc --no-ri --no-user-install" > $_srcdir/.gemrc
  HOME=$_srcdir $_bundle config --local build.sigar '--with-cppflags="-fgnu89-inline"'
  HOME=$_srcdir $_bundle install --without development test --with $_db --deployment
  HOME=$_srcdir $_bundle clean

  msg "Patch configuration examples"
  _version="head-p$(git --git-dir="$srcdir/$_projectname/.git" log -1 --pretty="format:%H" | cut -c1-8)"

  sed -i -e "s|number: \"head\"|number: \"$_version\"|" \
      $_srcdir/config/defaults.yml
  sed -i -e "s|#certificate_authorities: '/etc/ssl/certs/ca-certificates.crt'|certificate_authorities: '/etc/ssl/certs/ca-certificates.crt'|" \
         -e "s|#rails_environment: 'production'|rails_environment: 'production'|" \
      $_srcdir/config/diaspora.yml.example
  sed -i -e "s|<<: \*postgresql|<<: *$_db|" \
         -e "s|#<<: \*mysql||" \
      $_srcdir/config/database.yml.example

  cp $_srcdir/config/diaspora.yml{.example,}
  cp $_srcdir/config/database.yml{.example,}

  msg "Create secret token"
  HOME=$_srcdir $_bundle exec $_rake generate:secret_token

  msg "Precompile assets"
  DB=$_db $_bundle exec $_rake assets:precompile

  rm $_srcdir/config/{diaspora,database}.yml

  msg "Copy contents to package directory"
  install -dm755 $pkgdir/usr/share/webapps/$_projectname
  cp -Rf $_srcdir/* $pkgdir/usr/share/webapps/$_projectname/
  cp -Rf $_srcdir/.bundle $pkgdir/usr/share/webapps/$_projectname/
  install -Dm644 $_srcdir/.gemrc $pkgdir/usr/share/webapps/$_projectname/.gemrc
  install -Dm640 $_srcdir/config/initializers/secret_token.rb $pkgdir/etc/webapps/$_projectname/secret_token.rb
  install -Dm644 $srcdir/$_projectname.service $pkgdir/usr/lib/systemd/system/$_projectname.service
  install -Dm644 $srcdir/$_projectname.tmpfiles.d.conf $pkgdir/usr/lib/tmpfiles.d/$pkgbase.conf
  install -Dm644 $srcdir/$_projectname.bashrc  $pkgdir/usr/share/webapps/$_projectname/.bashrc
  install -Dm644 $srcdir/$_projectname.bash_profile $pkgdir/usr/share/webapps/$_projectname/.bash_profile

  msg "Build source.tar.gz to conform the AGPL"
  tar czf $pkgdir/usr/share/webapps/$_projectname/public/source.tar.gz \
          $pkgdir/usr/share/webapps/$_projectname/{app,db,lib,script,Gemfile,Gemfile.lock,Rakefile,Procfile,config.ru}

  msg "Symlink ruby and bundle"
  install -dm755          $pkgdir/usr/share/webapps/$_projectname/bin
  ln -sf /usr/bin/$_ruby   $pkgdir/usr/share/webapps/$_projectname/bin/ruby
  ln -sf /usr/bin/$_bundle $pkgdir/usr/share/webapps/$_projectname/bin/bundle

  msg "Prepare configuration files"
  install -dm750 $pkgdir/etc/webapps/$_projectname
  install -Dm640 $_srcdir/config/diaspora.yml.example $pkgdir/etc/webapps/$_projectname/diaspora.yml
  install -Dm640 $_srcdir/config/database.yml.example $pkgdir/etc/webapps/$_projectname/database.yml

  sed -i -e "s|%db%|$_db|" \
         -e "s|mysql|mysqld|" \
      $pkgdir/usr/lib/systemd/system/$_projectname.service

  msg "Create symlinks"
  install -dm755 $pkgdir/var/log/$_projectname
  install -dm755 $pkgdir/tmp/$_projectname
  install -dm755 $pkgdir/var/lib/$_projectname/uploads
  rm -Rf $pkgdir/usr/share/webapps/$_projectname/log \
         $pkgdir/usr/share/webapps/$_projectname/tmp \
         $pkgdir/usr/share/webapps/$_projectname/public/uploads
  ln -s  /etc/webapps/$_projectname/diaspora.yml    $pkgdir/usr/share/webapps/$_projectname/config/diaspora.yml
  ln -s  /etc/webapps/$_projectname/database.yml    $pkgdir/usr/share/webapps/$_projectname/config/database.yml
  ln -sf /etc/webapps/$_projectname/secret_token.rb $pkgdir/usr/share/webapps/$_projectname/config/initializers/secret_token.rb
  ln -sf /var/lib/$_projectname/uploads             $pkgdir/usr/share/webapps/$_projectname/public/uploads
  ln -sf /tmp/$_projectname                         $pkgdir/usr/share/webapps/$_projectname/tmp
  ln -sf /var/log/$_projectname                     $pkgdir/usr/share/webapps/$_projectname/log
}

package_diaspora-mysql-git() {
  pkgdesc="$pkgdesc (MySQL)"
  depends=(${depends[@]} 'libmysqlclient' 'mysql')
  conflicts=(${conflicts[@]} 'diaspora-postgresql-git')

  _package mysql
}

package_diaspora-postgresql-git() {
  pkgdesc="$pkgdesc (PostgreSQL)"
  depends=(${depends[@]} 'postgresql-libs' 'postgresql')
  conflicts=(${conflicts[@]} 'diaspora-mysql-git')

  _package postgresql
}

sha256sums=('SKIP'
            'e619b842b16fce0006e9273ad299058e4e2e2c81b9694055c2acd5c745985f1c'
            'ecc9b0ca36fd277a5d9b2fa2df11feef877ffb2b2ac4c6012e23db28ced05ee6'
            '26ae975338c5ab3fc506bd7bdb13d1b9f853ac0b9d8e591babf63c22a502d3be'
            '86ea685b6989ce855e6371dbb4de615e2b8d939643676e8e4e07326bc5220c87'
            '29cfd5116e919d8851ff70b8b82af8d4a6c8243a9d1ca555981a1a695e2d7715')

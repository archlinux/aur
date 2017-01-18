# Maintainer: Jonne Haß <me@jhass.eu>
pkgname='diaspora-mysql'
pkgver=0.6.2.0
pkgrel=4
pkgdesc="A distributed privacy aware social network (MySQL)"
arch=('i686' 'x86_64')
url="https://diasporafoundation.org"
license=('AGPL3')
depends=('ruby2.3' 'ruby2.3-bundler' 'redis' 'imagemagick' 'libxslt' 'net-tools' 'gsfonts' 'libmariadbclient')
optdepends=('mariadb: Database server')
makedepends=('nodejs')
conflicts=('diaspora-postgresql' 'diaspora-mysql-git' 'diaspora-postgresql-git')
options=(!strip)
backup=("etc/webapps/diaspora/diaspora.yml"
        "etc/webapps/diaspora/database.yml"
        "etc/webapps/diaspora/secret_token.rb")
install="diaspora.install"
source=("diaspora-${pkgver}.tar.gz::https://github.com/diaspora/diaspora/archive/v${pkgver}.tar.gz"
        "diaspora.install"
        "diaspora.service"
        "diaspora.tmpfiles.d.conf"
        "diaspora.bashrc"
        "diaspora.bash_profile")



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

build() {
  _bundle=bundle-2.3
  _ruby=ruby-2.3
  _rake=rake-2.3
  _builddir=$srcdir/build

  _reset_ruby

  msg "Setup build directory"
  rm -rf $_builddir
  mkdir -p $_builddir
  cp -Rf $srcdir/diaspora-0.6.2.0/{bin,app,config,db,public,lib,script,vendor,config.ru,Gemfile,Gemfile.lock,Rakefile} $_builddir

  cd $_builddir

  msg "Bundle dependencies"
  echo "gem: --no-rdoc --no-ri --no-user-install" > $_builddir/.gemrc
  HOME=$_builddir $_bundle config --local build.sigar '--with-cppflags="-fgnu89-inline"'
  HOME=$_builddir $_bundle install --without development test --with mysql --deployment

  msg "Patch configuration examples"
  sed -i -e "s|#certificate_authorities: '/etc/ssl/certs/ca-certificates.crt'|certificate_authorities: '/etc/ssl/certs/ca-certificates.crt'|" \
         -e "s|#rails_environment: 'production'|rails_environment: 'production'|" \
         -e "s|#listen: 'unix:tmp/diaspora.sock'|listen: '/run/diaspora/diaspora.sock'|" \
      $_builddir/config/diaspora.yml.example
  sed -i -e "s|<<: \*postgresql|<<: *mysql|" \
         -e "s|#<<: \*mysql||" \
      $_builddir/config/database.yml.example

  cp $_builddir/config/diaspora.yml{.example,}
  cp $_builddir/config/database.yml{.example,}

  msg "Create secret token"
  HOME=$_builddir RAILS_ENV=production $_bundle exec $_rake generate:secret_token

  msg "Precompile assets"
  HOME=$_builddir RAILS_ENV=production $_bundle exec $_rake assets:precompile

  rm $_builddir/config/{diaspora,database}.yml
}

package() {
  _bundle=bundle-2.3
  _ruby=ruby-2.3
  _builddir=$srcdir/build

  msg "Copy contents to package directory"
  install -dm755 $pkgdir/usr/share/webapps/diaspora
  cp -Rf $_builddir/* $pkgdir/usr/share/webapps/diaspora/
  cp -Rf $_builddir/.bundle $pkgdir/usr/share/webapps/diaspora/
  install -Dm644 $_builddir/.gemrc $pkgdir/usr/share/webapps/diaspora/.gemrc
  install -Dm640 $_builddir/config/initializers/secret_token.rb $pkgdir/etc/webapps/diaspora/secret_token.rb
  install -Dm644 $srcdir/diaspora.service $pkgdir/usr/lib/systemd/system/diaspora.service
  install -Dm644 $srcdir/diaspora.tmpfiles.d.conf $pkgdir/usr/lib/tmpfiles.d/diaspora.conf
  install -Dm644 $srcdir/diaspora.bashrc  $pkgdir/usr/share/webapps/diaspora/.bashrc
  install -Dm644 $srcdir/diaspora.bash_profile $pkgdir/usr/share/webapps/diaspora/.bash_profile

  msg "Build source.tar.gz to conform the AGPL"
  tar czf $pkgdir/usr/share/webapps/diaspora/public/source.tar.gz \
          $pkgdir/usr/share/webapps/diaspora/{app,db,lib,script,Gemfile,Gemfile.lock,Rakefile,config.ru}

  msg "Symlink ruby and bundle"
  install -dm755           $pkgdir/usr/share/webapps/diaspora/bin
  ln -sf /usr/bin/$_ruby   $pkgdir/usr/share/webapps/diaspora/bin/ruby
  ln -sf /usr/bin/$_bundle $pkgdir/usr/share/webapps/diaspora/bin/bundle

  msg "Prepare configuration files"
  install -dm750 $pkgdir/etc/webapps/diaspora
  install -Dm640 $_builddir/config/diaspora.yml.example $pkgdir/etc/webapps/diaspora/diaspora.yml
  install -Dm640 $_builddir/config/database.yml.example $pkgdir/etc/webapps/diaspora/database.yml

  msg "Create symlinks"
  install -dm755 $pkgdir/var/log/diaspora
  install -dm755 $pkgdir/var/lib/diaspora/uploads
  rm -Rf $pkgdir/usr/share/webapps/diaspora/log \
         $pkgdir/usr/share/webapps/diaspora/tmp \
         $pkgdir/usr/share/webapps/diaspora/public/uploads
  ln -s  /etc/webapps/diaspora/diaspora.yml    $pkgdir/usr/share/webapps/diaspora/config/diaspora.yml
  ln -s  /etc/webapps/diaspora/database.yml    $pkgdir/usr/share/webapps/diaspora/config/database.yml
  ln -sf /etc/webapps/diaspora/secret_token.rb $pkgdir/usr/share/webapps/diaspora/config/initializers/secret_token.rb
  ln -sf /var/lib/diaspora/uploads             $pkgdir/usr/share/webapps/diaspora/public/uploads
  ln -sf /tmp/diaspora                         $pkgdir/usr/share/webapps/diaspora/tmp
  ln -sf /var/log/diaspora                     $pkgdir/usr/share/webapps/diaspora/log
}

sha256sums=('f4fb1cb2a551bd12be9ade748236e2e0b241e8f7c363e555bfe9481d46ac52e6'
            'aae126c4b1bcba6265d3d925dc3845bb034defa5606385c22dfb053111b57685'
            '2ac3ef6c4f0396b7738b18d07c56f57e0db5e5e194bf8b07ffd6ad790dd92e17'
            '7128024976c95d511d8995c472907fe0b8c36fe5b45fef57fc053e3fadcae408'
            '77cb2529eacef2d1e77aad5daf21856f67097d6342f230e5dd5057f753932bfa'
            '29cfd5116e919d8851ff70b8b82af8d4a6c8243a9d1ca555981a1a695e2d7715')

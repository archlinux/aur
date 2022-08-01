# Maintainer: Jonne Haß <me@jhass.eu>
pkgname='diaspora-postgresql-git'
pkgver=0.7.18.0.r608.g58483bdd2
pkgrel=1
pkgdesc="A distributed privacy aware social network (development head) (PostgreSQL)"
arch=('i686' 'x86_64')
url="https://diasporafoundation.org"
license=('AGPL3')
depends=('ruby2.6' 'ruby2.6-bundler' 'redis' 'imagemagick' 'libxslt' 'net-tools' 'gsfonts' 'libtirpc' 'postgresql-libs')
optdepends=('jemalloc: lower memory consumption' 'postgresql: Database server')
makedepends=('nodejs' 'git')
conflicts=('diaspora-mysql' 'diaspora-postgresql' 'diaspora-mysql-git')
options=(!strip)
backup=("etc/webapps/diaspora/diaspora.yml"
        "etc/webapps/diaspora/diaspora.toml"
        "etc/webapps/diaspora/database.yml"
        "etc/webapps/diaspora/secret_token.rb")
install="diaspora.install"
source=("git+https://github.com/diaspora/diaspora.git#branch=develop"
        "diaspora.install"
        "diaspora.service"
        "diaspora.tmpfiles.d.conf"
        "diaspora.bashrc"
        "diaspora.bash_profile")


pkgver() {
  cd $srcdir/diaspora
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

build() {
  _bundle=bundle-2.6
  _ruby=ruby-2.6
  _rake=rake-2.6
  _gem=gem-2.6
  _builddir=$srcdir/build

  _reset_ruby

  msg "Setup build directory"
  rm -rf $_builddir
  mkdir -p $_builddir
  cp -Rf $srcdir/diaspora/{bin,app,config,db,public,lib,script,vendor,config.ru,Gemfile,Gemfile.lock,Rakefile} $_builddir

  cd $_builddir

  msg "Bundle dependencies"
  echo "gem: --no-rdoc --no-ri --no-user-install" > $_builddir/.gemrc
  export GEM_HOME="$_builddir/vendor/bundle"
  HOME=$_builddir $_gem install bundler -v 1.17.3
  HOME=$_builddir $_bundle config --local path vendor/bundle
  HOME=$_builddir $_bundle config --local frozen 1
  HOME=$_builddir $_bundle config --local disable_shared_gems true
  HOME=$_builddir $_bundle config --local with postgresql
  HOME=$_builddir $_bundle config --local without development:test
  HOME=$_builddir C_INCLUDE_PATH=/usr/include:/usr/include/tirpc $_bundle install

  msg "Patch configuration examples"
  sed -i -e 's|#certificate_authorities = "/etc/ssl/certs/ca-certificates.crt"|certificate_authorities = "/etc/ssl/certs/ca-certificates.crt"|' \
         -e 's|#rails_environment = "production"|rails_environment = "production"|' \
         -e 's|#listen = "unix:tmp/diaspora.sock"|listen = "/run/diaspora/diaspora.sock"|' \
      $_builddir/config/diaspora.toml.example
  sed -i -e "s|<<: \*postgresql|<<: *postgresql|" \
         -e "s|#<<: \*mysql||" \
      $_builddir/config/database.yml.example

  cp $_builddir/config/diaspora.toml{.example,}
  cp $_builddir/config/database.yml{.example,}

  msg "Create secret token"
  HOME=$_builddir RAILS_ENV=production $_bundle exec $_rake generate:secret_token

  msg "Precompile assets"
  HOME=$_builddir RAILS_ENV=production $_bundle exec $_rake assets:precompile

  rm $_builddir/config/{diaspora.toml,database.yml}
}

package() {
  _bundle=bundle-2.6
  _ruby=ruby-2.6
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
  install -Dm640 $_builddir/config/diaspora.toml.example $pkgdir/etc/webapps/diaspora/diaspora.toml
  install -Dm640 $_builddir/config/database.yml.example $pkgdir/etc/webapps/diaspora/database.yml

  msg "Create symlinks"
  install -dm755 $pkgdir/var/log/diaspora
  install -dm755 $pkgdir/var/lib/diaspora/uploads
  rm -Rf $pkgdir/usr/share/webapps/diaspora/log \
         $pkgdir/usr/share/webapps/diaspora/tmp \
         $pkgdir/usr/share/webapps/diaspora/public/uploads
  ln -s  /etc/webapps/diaspora/diaspora.toml   $pkgdir/usr/share/webapps/diaspora/config/diaspora.toml
  ln -s  /etc/webapps/diaspora/database.yml    $pkgdir/usr/share/webapps/diaspora/config/database.yml
  ln -sf /etc/webapps/diaspora/secret_token.rb $pkgdir/usr/share/webapps/diaspora/config/initializers/secret_token.rb
  ln -sf /var/lib/diaspora/uploads             $pkgdir/usr/share/webapps/diaspora/public/uploads
  ln -sf /tmp/diaspora                         $pkgdir/usr/share/webapps/diaspora/tmp
  ln -sf /var/log/diaspora                     $pkgdir/usr/share/webapps/diaspora/log
}

sha256sums=('SKIP'
            'aae126c4b1bcba6265d3d925dc3845bb034defa5606385c22dfb053111b57685'
            'd10f10439e56c38a9960e7cd481c7b44a68bc0ecf7c88b91d9cafb454aa6ffd0'
            '7128024976c95d511d8995c472907fe0b8c36fe5b45fef57fc053e3fadcae408'
            '77cb2529eacef2d1e77aad5daf21856f67097d6342f230e5dd5057f753932bfa'
            '29cfd5116e919d8851ff70b8b82af8d4a6c8243a9d1ca555981a1a695e2d7715')

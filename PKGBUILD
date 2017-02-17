# Maintainer: Javier Torres <javier@javiertorres.eu>
pkgname=carto-builder
pkgver=4.0.0.r2730.b79f384fae
pkgrel=1
pkgdesc="Location Intelligence & Data Visualization tool"
arch=('x86_64')
url="https://github.com/CartoDB/cartodb"
license=('BSD')
groups=()
depends=('ruby-bundler' 'postgis' 'redis' 'python2')
makedepends=('git' 'npm')
provides=()
conflicts=()
replaces=()
backup=('etc/carto/builder/config/app_config.yml' 'etc/carto/builder/config/database.yml')
options=()
install=
source=('git+https://github.com/CartoDB/cartodb.git'
        'disable_preflight.patch'
        'default_config.patch'
        'carto-builder.service'
        'carto-resque.service')
noextract=()
sha256sums=('SKIP'
            '44bdb4e954fa891745257205ca72707f985a32d7023daa03146d6512338a0097'
            'fa05d876025e4174163a933671ca417c1978fd796f5274d3dbcb3be7e9b66ce9'
            '8cdc2866713b4ae0df5e007d672033b48992382186e53c8cb53d15a58755e8ae'
            '9dd127fc44c767fa6d7ba4f508680991006c5691466f9adc35a84e02a615aec7')

pkgver() {
  cd "$srcdir/cartodb"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$srcdir/cartodb"
  patch -p1 < "$srcdir/default_config.patch"
  patch -p1 < "$srcdir/disable_preflight.patch"
}

build() {
  cd "$srcdir/cartodb"
  bundle install --path vendor/bundle
  npm install
  git submodule update --init
  bundle exec node_modules/.bin/grunt
}

package() {
  cd "$srcdir/cartodb"
  mkdir -p "$pkgdir/opt/carto/builder"
  cp -ar app .bundle config config.ru db Gemfile Gemfile.lock lib package.json public Rakefile script services vendor "$pkgdir/opt/carto/builder"
  rm "$pkgdir/opt/carto/builder/lib/tasks/random_data.rake"
  find "$pkgdir/opt/carto/builder" -name spec -type d -prune -exec rm -r {} \;

  # Link to config
  rm "$pkgdir/opt/carto/builder/config/app_config.yml" "$pkgdir/opt/carto/builder/config/database.yml"
  ln -s "/etc/carto/builder/config/app_config.yml" "/etc/carto/builder/config/database.yml" "$pkgdir/opt/carto/builder/config"

  install -Dm0644 "$srcdir/carto-builder.service" "$pkgdir/usr/lib/systemd/system/carto-builder.service"
  install -Dm0644 "$srcdir/carto-resque.service" "$pkgdir/usr/lib/systemd/system/carto-resque.service"
  install -Dm0644 config/app_config.yml.sample "$pkgdir/etc/carto/builder/config/app_config.yml"
  install -Dm0644 config/database.yml.sample "$pkgdir/etc/carto/builder/config/database.yml"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/var/log/carto/builder"
}

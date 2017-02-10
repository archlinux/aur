# Maintainer: Javier Torres <jtorres@carto.com>
pkgname=carto-builder
pkgver=4.0.0.r2368.feec05b8b6
pkgrel=2
pkgdesc="Location Intelligence & Data Visualization tool"
arch=('x86_64')
url="https://github.com/CartoDB/cartodb"
license=('BSD')
groups=()
depends=('ruby-bundler' 'postgis' 'redis' 'unp')
makedepends=('git' 'npm')
provides=()
conflicts=()
replaces=()
backup=('etc/carto/builder/config/app_config.yml' 'etc/carto/builder/config/database.yml')
options=()
install=
source=('git+https://github.com/CartoDB/cartodb.git'
        'Gemfile.patch'
        'disable_preflight.patch'
        'ruby_24.patch'
        'default_config.patch'
        'carto-builder.service'
        'carto-resque.service')
noextract=()
sha256sums=('SKIP'
            'b34dea111507e0044a1a059c84118c066e73280a2d9c00880c6af63d362064de'
            '44bdb4e954fa891745257205ca72707f985a32d7023daa03146d6512338a0097'
            '50ad83fadbb74ff44a19dfd1875b5ca05aac9f49ecfa690fa8ed104595868fe0'
            '2873a6644d7abca327c2c9125c9c1d9d1b452b1c8081149295b0e13614a4368c'
            '8cdc2866713b4ae0df5e007d672033b48992382186e53c8cb53d15a58755e8ae'
            '9dd127fc44c767fa6d7ba4f508680991006c5691466f9adc35a84e02a615aec7')

pkgver() {
	cd "$srcdir/cartodb"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/cartodb"
  patch -p1 < "$srcdir/Gemfile.patch"
  patch -p1 < "$srcdir/disable_preflight.patch"
  patch -p1 < "$srcdir/ruby_24.patch"
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

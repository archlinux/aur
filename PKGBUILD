# Contributor: amo <https://aur.archlinux.org/account/amo>
# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>

pkgname=papermerge
pkgver=1.5.5
pkgrel=2
pkgdesc="An open source document management system (DMS) primarily designed for archiving and retrieving your digital documents."
arch=('any')
url="https://github.com/ciur/papermerge"
license=('Apache')
backup=("etc/$pkgname.conf.py" "usr/lib/python3.9/site-packages/config/settings/production.py")
install=$pkgname.install
depends=('imagemagick' 'pdftk' 'poppler' 'python-celery'
         'python-django' 'python-django-allauth' 'python-django-celery-results'
         'python-django-dynamic-preferences' 'python-django-modelcluster'
         'python-django-mptt' 'python-django-polymorphic-tree' 'python-django-rest-framework'
         'python-django-rest-knox' 'python-django-taggit' 'python-imapclient' 'python-lxml'
         'python-mgclipboard' 'python-mglib' 'python-psycopg2' 'python-pyaml' 'tesseract' 'gunicorn')
makedepends=('python-setuptools')
#checkdepends=('python-dateutil')
optdepends=('nginx: reverse proxy for papermerge provided by gunicorn'
            'redis: file based transport of messaging queue'
            'python-redis: file based transport of messaging queue')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/ciur/$pkgname/archive/v$pkgver.tar.gz"
      "$pkgname.install"
      "$pkgname.sysusers"
      "$pkgname.tmpfiles"
      "$pkgname-gunicorn.service"
      "$pkgname-worker.service"
      "$pkgname.sh")
sha512sums=('a99a68b112ebc63ba271e5595c78fad33b866aa09b9902a722bb3c1ac400e68ad62ad84d33f6d3665747b1cbb176be6ada9ea30650148f2da286b56c3d91c0b7'
          'dacb635083fea138884836e8eae08e9c8c6685e08d8836960cd1e5c27ef59b5d4718ce56c4bff883af7d380a983866581cc479ce259ac67055a014dbddaa6fbd'
          'eb408d6d6c0072b4883cae9b6aa591935b910585e93aa6fdacbb543dbc4233588678d396c06d0f10b7c74b4d393af19b8be526d094821de23792c29df593d4a5'
          '6b14701ab03192756f00d7d9105aceba82c808341099819e4830e601d005e808261c381b0580d65e9d0d489a6906bf85b249edb6b5f6d8bd5173f2b78e8fefce'
          '4a8e1d3ce19e0ce13febea0c93d5130c492eb3d319194eb63791ad5a95f40083f2f90d299a74f1059865db1d38b6effb1f9cbfe4576680a70b43b6a594c85b9a'
          'fcdd49e0b6b93ade84ddafd77111f28bdea75a4f12829ec249d414d46a14399198be7bf29d0ce5166de6dba1d6386eda4ab9b39a1f5376b7c7758c8966a53ce3'
          'b838d54dca56e45f99690ddaae1b058e3f72b314adf9d689869f14bb141a5bbf209df974eea20cb2305b127d5119d0b8d11293494d47350f6974edc6fffc374f')

prepare() {
  {
      echo 'DBDIR = "/var/lib/papermerge/database"';
      echo 'MEDIA_DIR = "/var/lib/papermerge/media"';
      echo 'STATIC_DIR = "/var/lib/papermerge/static"';
      echo 'IMPORTER_DIR = "/var/lib/papermerge/import"';
      echo 'TASK_QUEUE_DIR = "/var/tmp/papermerge/queue"'
  } >> "$pkgname-$pkgver/$pkgname.conf.py.example"

  # https://papermerge.readthedocs.io/en/latest/setup/server_configurations.html#step-1-install-gunicorn
  {
      echo 'from .base import *  # noqa';
      echo 'DEBUG = False';
      echo "ALLOWED_HOSTS = ['*']"
  } > "$pkgname-$pkgver/config/settings/production.py"

  # The admin package is missing somehow so let's move it plain stupid directly in place
  mkdir -p "$pkgname-$pkgver/build/lib/$pkgname/"
  cp -dpr --no-preserve=ownership "$pkgname-$pkgver/$pkgname/contrib" "$pkgname-$pkgver/build/lib/$pkgname/"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

#check() {
#  cd "$pkgname-$pkgver"
#  ./run_tests.sh
#}

package() {
  # tmpfiles.d
  install -Dm 644 "$pkgname.tmpfiles" \
      "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # sysusers.d
  install -Dm 644 "$pkgname.sysusers" \
      "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  # service files
  install -Dm 644 "$pkgname-gunicorn.service" \
      "$pkgdir/usr/lib/systemd/system/$pkgname-gunicorn.service"
  install -Dm 644 "$pkgname-worker.service" \
      "$pkgdir/usr/lib/systemd/system/$pkgname-worker.service"

  # wrapper
  install -Dm 755 "$pkgname.sh" \
      "$pkgdir/usr/bin/$pkgname-manage"

  cd "$pkgname-$pkgver" || exit

  # config
  install -Dm 644 "$pkgname.conf.py.example" \
      "$pkgdir/etc/$pkgname.conf.py"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

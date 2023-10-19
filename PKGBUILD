# Maintainer:
# Contributor: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# Contributor: Konstantin Stepanov <me@kstep.me>

_pkgname="systemd-cron-next"
pkgname="$_pkgname-git"
pkgver=1.0.2.r18.gd69afa9
pkgrel=1
pkgdesc="Systemd generator to generate timers/services from crontab and anacrontab files"
arch=('i686' 'x86_64')
url="https://github.com/systemd-cron/systemd-cron-next"
license=('MIT')

depends=(
  'run-parts'
  'systemd'
)
makedepends=(
  'rust'
)
optdepends=(
  'smtp-forwarder: sending emails'
)

provides=(
  'anacron'
  'cron'
  'systemd-cron'
)
conflicts=(
  'anacron'
  'cron'
)

source=(
  "0002-makefile.patch"
)
sha256sums=(
  '095f20fd780717da18c0251df0ff702a5953816120f3040a317ccc9dc3e1572b'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname-${pkgver%.r*}"
  _pkgext="zip"
  source+=(
    "0001-d69afa94.patch"
    "$_pkgsrc.$_pkgext"::"https://github.com/systemd-cron/systemd-crontab-generator/archive/v${pkgver%.r*}.$_pkgext"
  )
  sha256sums+=(
    '236cbbaa3cc56176874d96162ba49c5f642615596f9d50056c04ed65347fbf80'
    '455d1ea09ecb29efaec44255f6439794d2118d63133936b389fd3afd9c60cc2f'
  )
else
  # git package
  makedepends+=('git')

  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=(
    "$_pkgsrc"::"git+$url.git"
  )
  sha256sums+=(
    'SKIP'
  )

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

prepare() {
  cd "$_pkgsrc"

  for patch in "$srcdir"/*.patch ; do
    if [ -f "$patch" ] ; then
      printf 'Applying patch: %s\n' "${patch##*/}"
      patch -Np1 -F100 -i "$patch"
    fi
  done
}

build() {
  cd "$_pkgsrc"
   ./configure --prefix="/usr" --confdir="/etc"
   DESTDIR="${pkgdir:?}" make build
}

package() {
  cd "$_pkgsrc"
  DESTDIR="${pkgdir:?}" make install
  install -d -m 775 "${pkgdir:?}/var/spool/cron"
}

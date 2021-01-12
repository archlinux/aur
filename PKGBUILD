# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: git
pkgname=systemd-cron-next-git
pkgver=v1.0.2.r16.ga4c2de7
pkgrel=1
pkgdesc="Systemd generator to generate timers/services from crontab and anacrontab files"
arch=('i686' 'x86_64')
url="https://github.com/systemd-cron/systemd-cron-next"
license=('MIT')
depends=('systemd>=217' 'run-parts')
optdepends=('smtp-forwarder: sending emails')
makedepends=('rust' 'git')
provides=('cron' 'anacron')
conflicts=('cron' 'anacron')
replaces=('cron' 'anacron')
source=(
   "git+https://github.com/systemd-cron/systemd-cron-next.git"
   "makefile.patch"
)
sha256sums=('SKIP'
            '095f20fd780717da18c0251df0ff702a5953816120f3040a317ccc9dc3e1572b')

pkgver()
{
   cd "$srcdir/${pkgname%-git}"
   (  set -o pipefail
      git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
   )
   pkgrel=$(git diff --shortstat|cut -d' ' -f2)
}

prepare()
{
   cd "$srcdir/${pkgname%-git}"
   patch -p1 < "$srcdir/makefile.patch"
}

build()
{
    cd "$srcdir/${pkgname%-git}"
    ./configure --prefix="/usr" --confdir="/etc"
    DESTDIR="${pkgdir}" make build
}

package() {
   cd "$srcdir/${pkgname%-git}"
   DESTDIR="${pkgdir}" make install
   install -d -m 775 ${pkgdir}/var/spool/cron
}

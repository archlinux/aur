pkgname='webvirt-api-git'
pkgver=1.0.0.r6.gf6b4d01
pkgrel=1
pkgdesc='PAM-athenticated HTTP proxy to webvirtd'
groups=('webvirt-git')
license=('Apache')
url='https://github.com/kevr/webvirt_api'

arch=('any')
depends=(
  'webvirtd'
  'uwsgi'
  'uwsgi-plugin-python'
  'python-poetry'
  'python-virtualenv'
)
provides=('webvirt-api')
conflicts=('webvirt-api')

source=("${pkgname}::git+https://github.com/kevr/webvirt_api")
sha256sums=('SKIP')

install='webvirt-api-git.install'

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
  mkdir -p "$pkgdir"/usr/lib/sysusers.d

  # Add the shadow group, used for /etc/shadow read access to utilize
  # PAM authentication.
  echo 'g shadow - -' > "$pkgdir/usr/lib/sysusers.d/webvirt-api.conf"

  # Add webvirt to the shadow group
  echo 'm webvirt shadow' >> "$pkgdir/usr/lib/sysusers.d/webvirt-api.conf"

  cd "$pkgname"

  # Install application to /var/lib/webvirt_api
  find . -type f -exec install -vDm644 {} "$pkgdir"/var/lib/webvirt_api/{} \;

  # Install UWSGI configuration to /etc/uwsgi
  # Enable via: systemctl start uwsgi@webvirt_api
  install -Dm644 res/webvirt_api.ini "$pkgdir"/etc/uwsgi/webvirt_api.ini
}

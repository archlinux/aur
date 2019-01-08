# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: michalzxc
# Contributor: nbags <neilbags@gmail.com>

pkgname=fail2ban-git
pkgver=r4880.d88ce718
pkgrel=1
pkgdesc='Bans IPs after too many failed authentication attempts (git version)'
url='http://www.fail2ban.org/'
license=('GPL')
arch=('any')
depends=('python-pyinotify' 'whois' 'sqlite' 'python-systemd')
optdepends=('iptables' 'nftables')
makedepends=('python-setuptools')
checkdepends=('python-setuptools' 'python-coverage')
provides=('fail2ban')
conflicts=('fail2ban')
backup=(etc/fail2ban/fail2ban.conf
        etc/fail2ban/jail.conf
        etc/logrotate.d/fail2ban)
source=("${pkgname}::git+https://github.com/fail2ban/fail2ban.git"
        "https://github.com/fail2ban/fail2ban/pull/2174/commits/12df4ec92c27a25a300482f7707f27f7522f592f.patch")
sha256sums=('SKIP'
            '19dd85363a59a2bf743e8d119d183cdffa6f8f8554003b9a8c3fa119dfef22b4')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  cd $pkgname
  # fix tmpfiles.d warning in systemd 239
  # https://github.com/fail2ban/fail2ban/pull/2174
  patch -p1 -i ../12df4ec92c27a25a300482f7707f27f7522f592f.patch
  sed -i 's|self.install_dir|"/usr/bin"|' setup.py
  sed -i 's/^before = paths-debian.conf/before = paths-arch.conf/' config/jail.conf
}
build() {
  cd "${pkgname}"
  ./fail2ban-2to3
  python setup.py build
}

check() {
  # make temp copy to run coverage since it messes with file permissions
  cp -r $pkgname{,-coverage}
  cd "${pkgname}"
  coverage run bin/fail2ban-testcases || warning "Tests failed"
}

package() {
  cd "${pkgname}"
  python setup.py install --prefix /usr --root "${pkgdir}" --optimize=1

  #chmod 644 "${pkgdir}/usr/lib/python3.6/site-packages/fail2ban-0.11.0.dev0-py3.6.egg-info"/*

  install -Dm644 build/fail2ban.service \
    "${pkgdir}"/usr/lib/systemd/system/fail2ban.service
  install -Dm644 files/fail2ban-tmpfiles.conf \
    "${pkgdir}"/usr/lib/tmpfiles.d/fail2ban.conf
  install -Dm644 files/fail2ban-logrotate \
    "${pkgdir}"/etc/logrotate.d/fail2ban
  install -Dm644 files/bash-completion \
    "${pkgdir}"/usr/share/bash-completion/completions/fail2ban

  # fix sendmail location
  sed -i 's/sbin/bin/g' "${pkgdir}"/etc/fail2ban/action.d/sendmail*.conf

  install -Dm644 man/fail2ban.1 "${pkgdir}"/usr/share/man/man1/fail2ban.1
  install -Dm644 man/fail2ban-client.1 \
    "${pkgdir}"/usr/share/man/man1/fail2ban-client.1
  install -Dm644 man/fail2ban-regex.1 \
    "${pkgdir}"/usr/share/man/man1/fail2ban-regex.1
  install -Dm644 man/fail2ban-server.1 \
    "${pkgdir}"/usr/share/man/man1/fail2ban-server.1
  install -Dm644 man/jail.conf.5 "${pkgdir}"/usr/share/man/man5/jail.conf.5

  rm -r "${pkgdir}/run"
}

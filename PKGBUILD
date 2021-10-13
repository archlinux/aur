# Maintainer: Fabien LEFEBVRE <contact@d1ceward.com>

pkgname=dokku
pkgver=0.25.7
pkgrel=1
pkgdesc='Docker-powered PaaS that helps build and manage the lifecycle of applications'
arch=('any')
url='https://github.com/dokku/dokku'
license=('MIT')
depends=(
  'bash-completion'
  'bind'
  'cpio'
  'curl'
  'docker'
  'docker-image-labeler'
  'dos2unix'
  'git'
  'go'
  'gliderlabs-sigil'
  'inetutils'
  'herokuish'
  'jq'
  'man-db'
  'netrc'
  'net-tools'
  'nginx'
  'openbsd-netcat'
  'parallel'
  'plugn'
  'procfile-util'
  'rsync'
  'rsyslog'
  'sudo'
  'sshcommand'
  'unzip'
)
source=("https://github.com/dokku/dokku/archive/v$pkgver.zip"
        "$pkgname.install"
        "crontab_calls.patch"
        "systemd_calls.patch"
        "LICENSE")
sha256sums=('a10eece94f2eeb83e48dbda8a7f92b9251b9db718e92c924b6e6fcf69651ac37'
            '5b3e99b6be28f8c68e024d9127992bcd49c758566a6ecaa15f9788a411eab0f0'
            '88fae4d0578b9badaa91d1d4771952b4c7560ba2f56f4eda990034078a44431e'
            'c600fefea1c93e9f94192741adc679fb0a05674775d3677954f10db4e09205c6'
            'b1ac2fed5ac269fb7bbf651a3d37ef5fd56d2c33320e17cb6e23a22a93f5c046')
install="$pkgname.install"

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  export GOPATH="$srcdir/gopath"

  cd "$pkgname-$pkgver"

  # Fix issue on crontab calls with arch linux cron implementation
  patch -p1 -i "${srcdir}/crontab_calls.patch"

  # Fix issue with invalid service manager call for arch linux
  patch -p1 -i "${srcdir}/systemd_calls.patch"

  # Add .core and build go plugins
  for plugin in plugins/*; do
    if [ -e "$plugin/Makefile" ]; then make -C $plugin build; fi
    touch "$plugin/.core"
  done

  # Clean go plugins
  for plugin in plugins/*; do
    if [ -e "$plugin/Makefile" ]; then make -C $plugin src-clean; fi
  done
}

package() {
  # Install executable and license
  install -Dm755 "$pkgname-$pkgver/dokku" "$pkgdir/usr/bin/dokku"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/dokku/LICENSE"

  # Move all files in place
  mkdir -p "$pkgdir/var/lib/dokku/core-plugins/available"
  cp -R "$srcdir/$pkgname-$pkgver/plugins/." "$pkgdir/var/lib/dokku/core-plugins/available"

  # Version
  echo $pkgver > "$pkgdir/var/lib/dokku/VERSION"
}

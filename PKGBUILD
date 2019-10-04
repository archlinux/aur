# Maintainer: Mark Nottingham <mnot@mnot.net>

pkgname=datadog-puppy
pkgver=6.13.0
pkgrel=3
pkgdesc='Lightweight (Pythonless) Datadog Agent'
arch=('any')
provides=('datadog-agent')
license=('Apache')
url='https://datadoghq.com'
makedepends=('git' 'go' 'python' 'python-virtualenv')
depends=('glibc')
source=('datadog-agent.sysusers'
        'datadog-agent.tmpfiles'
        'datadog-agent.service')
sha512sums=('SKIP'
            'SKIP'
            'SKIP')
_repo="src/github.com/DataDog/datadog-agent"

prepare () {
  _repodir="$srcdir/$_repo"
  git clone https://github.com/DataDog/datadog-agent.git --depth=100 "$_repodir"
  cd "$_repodir"
  git fetch --tags
  git checkout tags/$pkgver -b $pkgver
}

build () {
  _repodir="$srcdir/$_repo"
  cd "$_repodir"
  virtualenv .
  source bin/activate
  pip install -r requirements.txt
  GOPATH="$srcdir" PATH="$GOPATH/bin:$PATH" invoke deps
  GOPATH="$srcdir" PATH="$GOPATH/bin:$PATH" invoke agent.build --puppy
  deactivate
}

package () {
  _repodir="$srcdir/$_repo"
  _agentdir="$_repodir/bin/agent"
  _distdir="$_agentdir/dist"

  install -D -m644 "$srcdir/datadog-agent.sysusers" "$pkgdir/usr/lib/sysusers.d/datadog-agent.conf"
  install -D -m644 "$srcdir/datadog-agent.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/datadog-agent.conf"
  install -D -m644 "$srcdir/datadog-agent.service" "$pkgdir/usr/lib/systemd/system/datadog-agent.service"

  install -D -m775 "$_agentdir/agent" "$pkgdir/usr/bin/datadog-agent"
  install -D -m664 "$_distdir/datadog.yaml" "$pkgdir/etc/datadog-agent/datadog.yaml.example"
  install -D -m664 "$_distdir/system-probe.yaml" "$pkgdir/etc/datadog-agent/system-probe.yaml.example"
  cp -a "$_distdir/conf.d" "$pkgdir/etc/datadog-agent/"
}
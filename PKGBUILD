# Maintainer: Donald Webster <fryfrog@gmail.com>
pkgname="traktarr-git"
pkgver=r1.1a1737f
pkgrel=1
pkgdesc="Use Trakt to add shows to Sonarr and movies to Radarr."
arch=(any)
url="https://github.com/l3uddz/traktarr"
license=('GPL3')

depends=('python'
         'python-backoff'
         'python-schedule'
         'python-click'
         'python-requests'
         'python-pyfiglet'
         'python-cashier'
         'python-attrdict')

optdepends=('sonarr: TV download automation for usenet and torrents.'
            'radarr: Movie download automation for usenet and torrents.')

provides=('traktarr')
conflicts=('traktarr')

source=('git+https://github.com/l3uddz/traktarr'
        'traktarr.tmpfiles'
        'traktarr.service'
        'config.json'
        'traktarr.sysusers')

sha512sums=('SKIP'
            'eca779036f63676e8e8d621d9ec24d991ea7f240bde43d1b18f523d6d08ca9a1fc1ffdfff6796acbfaacfc484b3e6d64140973cabae67ed4638b48cb19a743f2'
            '39cc9feb5620578d4bc56e873fbbf524cdd579dc904a947b734517eafec1969fa9589ee42ee158a908066f1d284f5623161597a3404e1d6be2605a6da6c9bb18'
            'cc5f858a8e903894b6ee992dc8946d6ffeffe0cb25293d0721c82f24d36905f36c33625c8d81afbd8825b928d2938674b14b14122055d861c948e1a3bd9a60e6'
            'e5a11499ae6057531498a1b5b87f6812b74d3ba775292de46eaffbe2883493689b211b12b37c2b56fa1c9fa1893c303d6b0ae517ca83adbcd3513844df0607ee')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/traktarr"
  install -D -m 666 "${srcdir}/config.json" "${pkgdir}/usr/lib/traktarr/"
  cd "${srcdir}/traktarr/"
  cp -dpr --no-preserve=ownership assets helpers media misc notifications traktarr.py "${pkgdir}/usr/lib/traktarr/"

  install -D -m 644 "${srcdir}/traktarr.service" "${pkgdir}/usr/lib/systemd/system/traktarr.service"
  install -D -m 644 "${srcdir}/traktarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/traktarr.conf"
  install -D -m 644 "${srcdir}/traktarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/traktarr.conf"
}

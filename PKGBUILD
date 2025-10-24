# Contributor: Brandon Mittman <brandonmittman@gmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgbase=jellyfin-git
pkgname=(jellyfin-git jellyfin-web-git jellyfin-server-git)
pkgver=10.11.0.r27881.d167d59
pkgrel=1
pkgdesc='The Free Software Media System'
arch=('any')
url='https://jellyfin.org'
_url='https://github.com/jellyfin/jellyfin'
license=('GPL2')
makedepends=('dotnet-sdk>=9' 'npm' 'git')
provides=('jellyfin')
conflicts=('jellyfin')
source=('git+https://github.com/jellyfin/jellyfin.git'
        'git+https://github.com/jellyfin/jellyfin-web.git'
        "jellyfin-packaging::git+${_url}-packaging"
        'sysusers.conf'
        'tmpfiles.conf'
        'fix-service-file.patch'
        'fix-ffmpeg-default.patch'
        'fix-npm-max-version.patch'
        'fix-npm-lockfile.patch'
      )
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '3d2699174fe8719536e4f3ad98bac609a959815e38491f166257d248c195f007745634fa1907557d55c814bb06235130e9cea2d226770956004650d7d9b2b564'
            '3e12ec3d3fcb15975d5f86bc3ce3363ae89b0e9e0b2580c29fc8a612c0220a74a067138b15c48ae27bb3c5777eca33055f10651949678a1ee7bd094293f6abb6'
            'f2e1c0a6da7a4edc850ab7fb6b93edc3b97c9a1278e3ba88cb86da5260afe21fc59e8f230120119d0998868d99fb85bda4eb17afb1a99a031eabf8941b36cc40'
            '8d04e440cf8f545089d24ad4c4c927141e9f27be75c965decb96b378424bc96253dd5f12ffc62856a8c0b803e586ab2e4f80b911ba1557aeea1470a265d66668'
            '73604fd359cfa75335d0cde56ce445e4f400cfcfd347f3dad3362d1357bec89d81cb596e088b496c44349838db6929428206e3e7555611fdafa6bed90e44447f'
            '0d49d770f076ea8b644bf9e0fce49c1e36591625da53220d61cea9980c38aade4b97ef97af9ec2bf9ebe4ce0a9ef6cecf1a9c86e227dc89add50e39bc3fbcce1'
          )
pkgver() {
  cd jellyfin
  printf "%s.r%s.%s" "$(grep AssemblyVersion SharedVersion.cs | cut -d'"' -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  pushd jellyfin-packaging

  # fix systemd service file
  patch -p1 -i "$srcdir/fix-service-file.patch"

  # Fix ffmpeg default
  patch -p1 -i "$srcdir/fix-ffmpeg-default.patch"
  popd

  pushd jellyfin-web
  # Fix npm max version being set to fix issue with github ci tool
  patch -p1 -i "$srcdir/fix-npm-max-version.patch"
  patch -p1 -i "$srcdir/fix-npm-lockfile.patch"

  # download dependencies
  # FS#79713 - remove environment variable with 10.9.x release
  SKIP_PREPARE=1 npm ci --no-audit --no-fund --no-update-notifier
  popd
}

build(){
  pushd jellyfin

  # disable dotnet telemetry
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
  export DOTNET_NOLOGO=1

  dotnet \
    publish \
    Jellyfin.Server \
    --configuration Release \
    --output builddir \
    --self-contained false\
    --runtime "$_dotnet_runtime" \
    -p:DebugSymbols=false \
    -p:DebugType=none
  popd

  pushd jellyfin-web
  npm run build:production
  popd
}

package_jellyfin-git() {
  depends=("jellyfin-web-git=$pkgver" "jellyfin-server-git=$pkgver")
}

package_jellyfin-server-git() {
  pkgdesc='Jellyfin server backend'
  _pkgname="${pkgname%-server-git}"
  depends=(
    'dotnet-runtime>=9'
    'aspnet-runtime>=9'
    'ffmpeg'
    'sqlite'
  )
  backup=(
    "etc/$_pkgname/logging.json"
    "etc/$_pkgname/$_pkgname.env"
  )
  provides=('jellyfin-server')
  conflicts=('jellyfin-server')

  pushd jellyfin
  # install binaries
  install -vd "$pkgdir/usr/"{lib,bin}
  cp -r builddir "$pkgdir/usr/lib/jellyfin"
  ln -sf /usr/lib/jellyfin/jellyfin "$pkgdir/usr/bin/jellyfin"

  # ensure binaries have correct permissions
  chmod 755 "$pkgdir/usr/lib/$_pkgname/jellyfin"

  # use upstream provided packaging files
  cd "$srcdir/jellyfin-packaging/debian/conf"

  # systemd integration
  install -vDm644 jellyfin.service -t "$pkgdir/usr/lib/systemd/system"
  install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  # set /etc/jellyfin to 750 according to tmpfiles
  install -vdm750 "$pkgdir/etc/$_pkgname"
  install -vDm640 jellyfin "$pkgdir/etc/$_pkgname/$_pkgname.env"
  install -vDm640 logging.json -t "$pkgdir/etc/$_pkgname"
  popd
}

package_jellyfin-web-git() {
  pkgdesc="Jellyfin web client"
  provides=('jellyfin-web')
  conflicts=('jellyfin-web')

  pushd jellyfin-web
  install -vd "$pkgdir/usr/share/jellyfin/web"
  cp -vr dist/* "$pkgdir/usr/share/jellyfin/web"
}

# vim: ts=2 sw=2 et:

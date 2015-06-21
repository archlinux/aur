# Maintainer: mojangsta <mojangsta at slash dev slash null>
# psst -- this probably won't help you run pirated games
#      -- they usually provide their own proxy libs anyway
# however, i can confirm this works flawlessly with legit
# terraria 1.2.4.1 on wine-staging 1.7.39 + steam 1.0.0.49
pkgname=steambridge-git
_pkgname=steambridge
_prefix=/usr
pkgver=0.0.1.gb2c18b5
pkgrel=1
pkgdesc="A project to allow Steam applications running under WINE to communicate with a native Linux version of Steam."
arch=('any')
url="https://github.com/sirnuke/steambridge"
license=('MIT')
depends=('python2')
makedepends=('git')
optdepends=('steamcmd: fully downloads apps marked incompatible by steam'
            'steam: exposes native interface for steambridge to hook into'
            'wine: wine-staging (in pipelight repo) is better'
            'winetricks: gets useful libs such as dotnet40, xna40')
provides=('steambridge')
_proxy=steam_api_proxy.dll
# dropbox is more likely to fail so it goes first
source=(https://www.dropbox.com/sh/enwavibssmyxkq0/AADyVjdkULjkChZf_hxtC6VQa/0.0.2-2014-06-23/steam_api_proxy.dll
        git://github.com/sirnuke/steambridge.git)
sha256sums=(3f5d88539ce9cdffc109113172d1adb0dd58be93982b242528cb344031a17f7c
            SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/-.*-/-/' | sed 's/-/./'
}

build() {
  cd "$_pkgname"
  ./configure --prefix "$_prefix" --proxy "../$_proxy"
  make
}

package() {
  cd "$_pkgname"
# install.py doesn't accept $TESTDIR and
# chrooting is a majestic pain in the ass
# this is only slightly more dirty
  install -d "$pkgdir/$_prefix/share/steambridge"
  install -d "$pkgdir/$_prefix/bin"
  install -d "$pkgdir/$_prefix/lib/python2.7/site-packages"
  install -d "$pkgdir/$_prefix/share/steambridge/pysteambridge"
  install -d "$pkgdir/$_prefix/share/steambridge" # winedllpath
  install -d "$pkgdir/$_prefix/share/doc/steambridge"
  install -d "$pkgdir/$_prefix/share/doc/steambridge/licenses"
  ln -sT "$_prefix/share/steambridge/pysteambridge" "$pkgdir/$_prefix/lib/python2.7/site-packages/pysteambridge"
  install -Tm644 "libraries/bridge/steam_api_bridge.dll/steam_api_bridge.dll.so" "$pkgdir/$_prefix/share/steambridge/steam_api_bridge.dll.so"
  install -Tm644 "../$_proxy" "$pkgdir/$_prefix/share/steambridge/steam_api_proxy.dll"
  install -Tm644 "libraries/common/steam/libsteam_api.so" "$pkgdir/$_prefix/share/steambridge/libsteam_api.so"
  find tools/pysteambridge -maxdepth 1 -type f -name '*.py' | while read file; do
    install -m644 "$file" -t "$pkgdir/$_prefix/share/steambridge/pysteambridge"; done
( echo README.md COPYING | tr ' ' '\n';
  find documentation -maxdepth 1 -type f ) | while read file; do
    install -m644 "$file" -t "$pkgdir/$_prefix/share/doc/steambridge"; done
  find documentation/licenses -maxdepth 1 -type f | while read file; do
    install -m644 "$file" -t "$pkgdir/$_prefix/share/doc/steambridge/licenses"; done
  install -Tm755 "tools/steambridge.py" "$pkgdir/$_prefix/bin/steambridge"
}


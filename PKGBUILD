# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: andmars <andreas.marschall @ unitybox.de>
# Contributor: PyroPeter <googlemail.com @ abi1789>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=hplip-plugin
pkgver=3.26.4
pkgrel=1
pkgdesc="Binary plugin for HPs hplip printer driver library"
arch=(x86_64 aarch64 armv6h armv7h i686)
url="https://developers.hp.com/hp-linux-imaging-and-printing/binary_plugin.html"
license=(LicenseRef-HPLIP-LICENSE)
backup=(var/lib/hp/hplip.state)
# While hplip-plugin requires the version of hplip to match exactly,
# specifying such a requirement breaks the ability to upgrade hplip.
depends=("hplip>=$pkgver")
makedepends=(python)
options=(!debug) # Binary package cannot produce correct debug information
# https://developers.hp.com/hp-linux-imaging-and-printing/plugins
_date=2026-05
source=("$pkgname-$pkgver.run::https://developers.hp.com/sites/default/files/$_date/hplip-$pkgver-plugin.run"
        "$pkgname-$pkgver.run.asc::https://developers.hp.com/sites/default/files/$_date/hplip-$pkgver-plugin.run.asc"
        "scan-plugin-spec.py")
sha256sums=('199f78f8af7f36894d7180e9090963ce2550a75ec701f8a4ba37665a9746fdf0'
            'SKIP'
            'c6da101f46546f2145ecc0bf9b7bbb3fb5ecb40e799274e62a7e9bc435924d25')
validpgpkeys=('82FFA7C6AA7411D934BDE173AC69536A2CF3A243') # HPLIP (HP Linux Imaging and Printing) <hplip@hp.com>

# Thank you @Toolybird for the solution
_user_agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
DLAGENTS=("https::/usr/bin/curl --user-agent ${_user_agent// /\\ } -qgb '' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
  sh "$pkgname-$pkgver.run" --target "$srcdir/$pkgname-$pkgver" --noexec
}

package() {
  depends+=(libgcc libstdc++ glibc sane libusb-compat)

  cd "$srcdir/$pkgname-$pkgver"

  local line
  while read -r line
  do
    local -a splitted
    readarray -d, -n3 -t splitted <<< "$line"
    splitted[-1]="${splitted[-1]%$'\n'}"
    install -Dvm644 "${splitted[0]}" "$pkgdir/${splitted[1]}"
    if [[ "${splitted[0]}" == "license.txt" ]]
    then
      mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
      ln -srfv "$pkgdir/${splitted[1]}" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    elif [[ -n "${splitted[2]}" ]]
    then
      mkdir -p "$pkgdir/$(dirname "${splitted[2]}")"
      ln -srfv "$pkgdir/${splitted[1]}" "$pkgdir/${splitted[2]}"
    fi
  done < <(CARCH="$CARCH" python "$srcdir/scan-plugin-spec.py" | sort -u)

  install -Dm644 /dev/stdin "$pkgdir/var/lib/hp/hplip.state" << EOF
[plugin]
installed = 1
eula = 1
version = $pkgver
EOF
}

# Note: to check the install, perform: hp-diagnose_plugin

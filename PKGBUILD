_dnr_rulesets_ver=6.1.1

pkgname=firefox-extension-adguard
pkgver=5.6.2
#_tag=v${pkgver%.*}+${pkgver##*.}.build.20251216080045
_tag=v$pkgver
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("corepack" "git" "jq" "nodejs-lts-jod")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/$_tag.tar.gz"
        "dnr-rulesets-$_dnr_rulesets_ver.tar.gz::https://github.com/AdguardTeam/tsurlfilter/releases/download/dnr-rulesets-v$_dnr_rulesets_ver/dnr-rulesets.tgz")
sha256sums=('d83217dbadbe73f7c4f94420df8e1c84f63fd768c0abbbad5db6a51b894887a7'
            'aeb196a424398b7d947d912e3c1118c2d7e284192dd4d8c2e58e6cc49e0a0148')
noextract=("dnr-rulesets-$_dnr_rulesets_ver.tar.gz")
_version=${_tag//+/-}
_version=${_version#v}

prepare() {
    mkdir -p "$srcdir/bin"
    corepack enable --install-directory "$srcdir/bin"
    corepack install --global pnpm@10
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    cat >> pnpm-workspace.yaml << EOF
overrides:
  '@adguard/dnr-rulesets': file:$srcdir/dnr-rulesets-$_dnr_rulesets_ver.tar.gz
EOF
    corepack pnpm install --ignore-scripts
}
build() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    corepack pnpm run release firefox-amo --zip
}
check() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    # It breaks because failed to mapping extension map
    #corepack pnpm test
}
package() {
    depends=("firefox")

    cd "$srcdir/AdguardBrowserExtension-${_version}"
    id="$(jq -r .browser_specific_settings.gecko.id "./build/release/firefox-amo/manifest.json")"
    echo "Found extension id: $id"
    install -Dm644 "./build/release/firefox-amo.zip" "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}

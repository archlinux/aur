# Maintainer: Felix2086 <Felix-LIKE@users.noreply.github.com>
#
# Offline bird-photo identification. Ships the pipeline + eBird seed data
# read-only under /usr/share/birdid; the /usr/bin/birdid wrapper provisions a
# user-writable copy of the data on first run (--download/--update/--initialize
# write into it). The wrapper ships as a bundled file next to this PKGBUILD
# (source: "birdid-wrapper"), so the AUR package is self-contained.
#
# Runtime deps: python-pybioclip (our AUR package) brings the whole BioCLIP 2
# backend chain (python-pytorch, python-torchvision, python-open-clip-torch,
# python-pandas, python-prettytable). exiftool reads EXIF; numpy/lxml/requests
# are direct pipeline imports.
#
# The git+https source clones the public GitHub repo at build time; validated
# with makepkg against the live source (see ../local-test for the pre-public
# git+file:// override rig, kept for reference).

pkgname=birdid-git
pkgver=r54.134d583   # placeholder so lint passes; makepkg auto-updates it via pkgver()
pkgver() {
  cd "$pkgname"
  if desc="$(git describe --long --tags 2>/dev/null)"; then
    printf '%s\n' "$desc" | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
  else
    printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}
pkgrel=1
pkgdesc='Offline bird-photo identification with BioCLIP 2 (eBird/Clements taxonomy, XMP sidecars)'
arch=('any')
url='https://github.com/Felix-LIKE/local-bird-id'
license=('MIT')
depends=(
  'perl-image-exiftool'
  'python'
  'python-lxml'
  'python-numpy'
  'python-pybioclip'
  'python-requests'
)
makedepends=('git')
source=(
  "$pkgname::git+https://github.com/Felix-LIKE/local-bird-id.git#branch=main"
  "birdid-wrapper"
)
sha256sums=(
  'SKIP'
  '410261edb05e3694101fdaa18e0cb08bc9f6307fac8de9c36d8585b38caba080'
)

package() {
  cd "$pkgname"

  # pipeline + launcher (siblings so the launcher's SCRIPT_DIR/PIPELINE and
  # birdid.py's repo-relative data dir both resolve)
  install -Dm755 pipeline/birdid           "$pkgdir/usr/share/birdid/pipeline/birdid"
  install -Dm644 pipeline/birdid.py        "$pkgdir/usr/share/birdid/pipeline/birdid.py"
  install -Dm644 pipeline/ebird_data.py    "$pkgdir/usr/share/birdid/pipeline/ebird_data.py"
  install -Dm644 pipeline/README.md        "$pkgdir/usr/share/birdid/pipeline/README.md"

  # read-only eBird seed data. regions_generated/ and the downloaded
  # eBird_Taxonomy_v2023.csv are gitignored and NOT packaged: they only ever
  # live in the user-writable copy that the wrapper provisions.
  install -Dm644 ebird/README.md                              "$pkgdir/usr/share/birdid/ebird/README.md"
  install -Dm644 ebird/continents.csv                         "$pkgdir/usr/share/birdid/ebird/continents.csv"
  install -Dm644 ebird/countries.csv                          "$pkgdir/usr/share/birdid/ebird/countries.csv"
  install -Dm644 ebird/eBird-Clements_Integrated_Checklist.csv "$pkgdir/usr/share/birdid/ebird/eBird-Clements_Integrated_Checklist.csv"
  install -Dm644 ebird/gen_continents.py                      "$pkgdir/usr/share/birdid/ebird/gen_continents.py"
  install -Dm644 ebird/regions/EUROPE.csv                     "$pkgdir/usr/share/birdid/ebird/regions/EUROPE.csv"
  install -Dm644 ebird/regions/SEA.csv                        "$pkgdir/usr/share/birdid/ebird/regions/SEA.csv"

  # seed version stamp - the wrapper compares it to refresh stale user copies
  # of the seed data without touching user-downloaded tables.
  printf '%s\n' "$pkgver-$pkgrel" > "$pkgdir/usr/share/birdid/ebird/.seed-version"

  # user-facing command
  install -Dm755 "$srcdir/birdid-wrapper" "$pkgdir/usr/bin/birdid"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

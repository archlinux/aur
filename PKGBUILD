# Maintainer: Silvertuanzi <126318157+silvertuanzi@users.noreply.github.com>
# Adds <theme>/libadwaita-1.$_adw_minor/gtk.css next to the libadwaita-1.9
# directory that mint-themes 2.4.3 ships, so a libadwaita of the target minor finds
# the theme stylesheet instead of falling back to built-in Adwaita.
# The data is derived from the installed mint-themes package, hence the exact pin.
# On a mint-themes bump: rebuild this package; if upstream starts shipping the
# target directory itself, drop this package instead (prepare() enforces that).
# The stylesheet delta is generated from upstream 1.9.4 sources (the series
# mint-themes is built from) against the target libadwaita's built-in stylesheet,
# so there is no per-release CSS to ship. On a libadwaita minor bump: raise
# _adw_minor and pkgrel, rebuild.
pkgname=mint-themes-libadwaita
pkgver=2.4.3
pkgrel=1
pkgdesc='libadwaita theme stylesheets for mint-themes'
url="https://github.com/linuxmint/mint-themes"
arch=('any')
license=('GPL-3.0-or-later' 'LGPL-2.1-or-later')
_adw_minor=10
# pacman compares epochs: repo libadwaita is versioned 1:1.x, so the bounds carry 1:.
# >=1:1.10 and <1:1.11 together mean "the 1.10 series"; bump both with _adw_minor.
makedepends=('mint-themes=2.4.3' 'sassc' 'python' 'pkgconf' 'glib2-devel'
             "libadwaita>=1:1.$_adw_minor"
             "libadwaita<1:1.$((_adw_minor + 1))")
optdepends=(
  'libadwaita-mintpatch: enable mint theme support in libadwaita'
)
options=(!strip !debug)
source=('https://gitlab.gnome.org/GNOME/libadwaita/-/archive/1.9.4/libadwaita-1.9.4.tar.gz'
        'gen-stylesheet-supplement.py')
sha256sums=('ca5e60def9423bfc13c49d45c6de576a5b2dcae3beec880a23628ba101bdd4f1'
            'SKIP')

prepare() {
  if pacman -Qlq mint-themes | grep -q "/libadwaita-1\.$_adw_minor/"; then
    echo "mint-themes already ships libadwaita-1.$_adw_minor; drop this package instead." >&2
    exit 1
  fi

  local adw_ver
  adw_ver=$(pkg-config --modversion libadwaita-1)
  [[ $adw_ver == "1.$_adw_minor".* ]] || {
    echo "libadwaita $adw_ver is not 1.$_adw_minor.x; raise _adw_minor?" >&2
    exit 1
  }

  # Baseline: the upstream 1.9.x stylesheet that mint-themes 2.4.3 is built from.
  ( cd "$srcdir/libadwaita-1.9.4/src/stylesheet" &&
    sassc -a -M -t compact gtk.scss "$srcdir/baseline.css" )

  # Target: the stylesheet built into the libadwaita this package is for.
  gresource extract "$(pkg-config --variable=libdir libadwaita-1)/libadwaita-1.so.0" \
    /org/gnome/Adwaita/styles/gtk.css > "$srcdir/target.css"

  python3 "$srcdir/gen-stylesheet-supplement.py" \
    "$srcdir/baseline.css" "$srcdir/target.css" > "$srcdir/supplement.css"
}

package() {
  depends=('mint-themes')

  # Only the theme directories mint-themes owns, not whatever else is installed.
  local root="$srcdir/themes" theme css dir dest count=0
  rm -rf "$root"
  mkdir -p "$root"
  while read -r css; do
    theme=${css#/usr/share/themes/}
    theme=${theme%%/*}
    ln -s "/usr/share/themes/$theme" "$root/$theme"
  done < <(pacman -Qlq mint-themes | grep '/libadwaita-1\.9/gtk\.css$')

  for dir in "$root"/*/libadwaita-1.9; do
    [ -d "$dir" ] || continue
    theme=$(basename "$(dirname "$dir")")
    dest="$pkgdir/usr/share/themes/$theme/libadwaita-1.$_adw_minor"
    mkdir -p "$dest"
    cp -R "$dir/." "$dest/"          # cp -a would try to keep source ownership
    cat "$srcdir/supplement.css" >>"$dest/gtk.css"
    count=$((count + 1))
  done
  [ "$count" -gt 0 ] || { echo "no themes with libadwaita-1.9 under $root" >&2; exit 1; }
}

# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-axelrod')
pkgver=4.13.1
pkgrel=1
pkgdesc="Research tool for the Iterated Prisoner's Dilemma"
arch=('any')
url='https://github.com/Axelrod-Python/Axelrod'
license=('MIT')
checkdepends=('python-hypothesis' 'python-pytest')
makedepends=('python-setuptools')
depends=('python-dask' 'python-matplotlib' 'python-numpy' 'python-pandas'
         'python-pyarrow'  # Needed to import dask.dataframe
         'python-yaml' 'python-scipy' 'python-tqdm')
options=(!emptydirs)
sha256sums=('1b6b0e658c2859fa6ce4258a5924186226e0429af131961a1a8b952e229918e5')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

prepare() {
  cd "$srcdir/Axelrod-$pkgver"

  # Fix a test file that can't be imported
  sed -i 's/\.core//' axelrod/tests/unit/test_resultset.py
}

check() {
  cd "$srcdir/Axelrod-$pkgver"

  # Deselect tests failing in numpy 2.x because of its new repr
  python -m pytest --doctest-glob="*.md" --doctest-glob="*.rst" \
    -k "$(echo 'not (
      test_fingerprint_player
      or test_fingeprint_explicit_probe
      or (docs and (
        play_contexts
        or access_tournament_results
        or fingerprint
        or use_different_stage_games
        or running_axelrods_first_tournament
        or (new_to_game_theory_and_or_python and (
          match or moran or summarising_tournaments
        ))
      ))
    )' | xargs)"
}

package() {
  cd "$srcdir/Axelrod-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

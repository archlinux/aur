# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=mlst
pkgver=2.35.0
pkgrel=1
pkgdesc="Scan contig files against traditional PubMLST typing schemes"
arch=('any')
url="https://github.com/tseemann/mlst"
license=('GPL-2.0-only')
depends=(
  'perl'
  'perl-list-moreutils'
  'perl-json'
  'perl-moo'      # required by bundled MLST::* modules
  'blast+'        # blastn, makeblastdb (provided by AUR blast+-bin)
  'any2fasta'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f1291ed02494b7a862e0d56d8f501f500d7a4a207fe4244962b743df1c3dcc4')

package() {
  cd "$pkgname-$pkgver"

  # bin/mlst locates its bundled perl5/ modules and db/ via $FindBin::RealBin
  # which resolves under /usr/{perl5,db} when installed under /usr/bin.
  # Repoint at the system locations (MLST_DBDIR env still overrides db).
  sed -i 's#\$FindBin::RealBin/../perl5#/usr/share/mlst/perl5#' bin/mlst
  sed -i 's#\$FindBin::RealBin/../db#/usr/share/mlst/db#' bin/mlst

  # Helper scripts also derive db paths relative to their own location.
  sed -i 's#"\$DIR/../db/pubmlst"#"/usr/share/mlst/db/pubmlst"#; s#"\$DIR/../db/blast"#"/usr/share/mlst/db/blast"#' scripts/mlst-make_blast_db
  sed -i "s#dirname(\$0) . '/../db/pubmlst'#'/usr/share/mlst/db/pubmlst'#" scripts/mlst-show_seqs

  install -Dm755 bin/mlst "$pkgdir/usr/bin/mlst"
  install -Dm755 scripts/mlst-make_blast_db "$pkgdir/usr/bin/mlst-make_blast_db"
  install -Dm755 scripts/mlst-show_seqs "$pkgdir/usr/bin/mlst-show_seqs"

  # Bundled Perl modules (MLST::* + a vendored Path::Tiny).
  install -d "$pkgdir/usr/share/mlst/perl5"
  cp -a perl5/* "$pkgdir/usr/share/mlst/perl5/"

  # Bundled PubMLST database (schemes + pre-built BLAST indices).
  install -d "$pkgdir/usr/share/mlst/db"
  cp -a db/* "$pkgdir/usr/share/mlst/db/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

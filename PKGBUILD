# Maintainer: Augusto Modanese <augusto.modanese@aalto.fi>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# Contributor: florianbw <florian.bw@gmail.com>
# vim:set ts=2 sw=2 et:

pkgname=latex-template-springer
pkgver=20240108
pkgrel=1
pkgdesc="Springer templates for LNCS proceedings (llncs), other proceedings (svproc), journal articles (sn-jnl), monographs (svmono), and multiauthor volumes (svmult)"
arch=('any')
url="https://www.springernature.com/gp/authors/campaigns/latex-author-support"
license=('')
groups=()
depends=('texlive-latex')
makedepends=('unzip')
optdepends=()
provides=(latex-template-lncs)
conflicts=(latex-template-lncs)
replaces=(latex-template-lncs)
backup=()
options=()
install=texlive.install

source=('llncs.zip::https://resource-cms.springernature.com/springer-cms/rest/v1/content/19238648/data/v7'
  'svproc.zip::https://resource-cms.springernature.com/springer-cms/rest/v1/content/19338728/data/v1'
  'svjour.zip::https://resource-cms.springernature.com/springer-cms/rest/v1/content/18782940/data/v8'
  'svmono.zip::https://resource-cms.springernature.com/springer-cms/rest/v1/content/25980412/data/v2'
  'svmult.zip::https://resource-cms.springernature.com/springer-cms/rest/v1/content/25980414/data/v2')

noextract=("${source[@]%%::*}")

md5sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP')

package() {
  for zipfile in *.zip; do
    unzip $zipfile -d $(echo $zipfile | cut -d'.' -f1)
  done

  bibdir="${pkgdir}/usr/share/texmf-dist/bibtex/bib/springer"
  bstdir="${pkgdir}/usr/share/texmf-dist/bibtex/bst/springer"
  clsdir="${pkgdir}/usr/share/texmf-dist/tex/latex/springer"
  istdir="${pkgdir}/usr/share/texmf-dist/makeindex/springer"

  # llncs
  cd llncs
  install -m 0644 -D -t "${clsdir}" llncs.cls
  install -m 0644 -D -t "${bstdir}" splncs04.bst
  install -m 0644 -D -t "${pkgdir}/usr/share/doc/llncs" fig1.eps history.txt \
    llncsdoc.pdf readme.txt samplepaper.tex
  cd ..

  # svproc
  cd svproc
  install -m 0644 -D -t "${clsdir}" styles/svproc.cls styles/*.sty
  install -m 0644 -D -t "${istdir}" styles/*.ist
  install -m 0644 -D -t "${bstdir}" styles/bibtex/*.bst
  install -m 0644 -D -t "${pkgdir}/usr/share/doc/svproc" authinst.pdf \
    authsamp.pdf ftpinfo.txt history.txt quickstart.pdf readme.txt \
    refguide.pdf
  mv editor "${pkgdir}/usr/share/doc/svproc/"
  mv templates "${pkgdir}/usr/share/doc/svproc/"
  cd ..

  # sn-jnl
  cd svjour/sn-article-template
  install -m 0644 -D -t "${clsdir}" sn-jnl.cls
  install -m 0644 -D -t "${bibdir}" sn-bibliography.bib
  install -m 0644 -D -t "${bstdir}" bst/*.bst
  install -m 0644 -D -t "${pkgdir}/usr/share/doc/sn-jnl" empty.eps \
    fig.eps sn-article.pdf sn-article.tex user-manual.pdf
  cd ../..

  # svmono
  cd svmono
  install -m 0644 -D -t "${clsdir}" author/svmono.cls
  install -m 0644 -D -t "${istdir}" styles/*.ist
  install -m 0644 -D -t "${bstdir}" styles/*.bst
  install -m 0644 -D -t "${pkgdir}/usr/share/doc/svmono" history.txt \
    readme.txt styles/liesmich.txt
  rm author/*.bst author/*.ist author/svmono.cls
  mv author "${pkgdir}/usr/share/doc/svmono/"
  rm guideline/svmono.cls
  mv guideline "${pkgdir}/usr/share/doc/svmono/"
  cd ..

  # svmult
  cd svmult
  install -m 0644 -D -t "${clsdir}" svmult.cls
  install -m 0644 -D -t "${istdir}" styles/*.ist
  install -m 0644 -D -t "${bstdir}" styles/*.bst
  install -m 0644 -D -t "${pkgdir}/usr/share/doc/svmult" history.txt \
    readme.txt 
  rm author/*.bst author/*.ist author/svmult.cls
  mv author "${pkgdir}/usr/share/doc/svmult/"
  rm editor/*.bst editor/*.ist editor/svmult.cls
  mv editor "${pkgdir}/usr/share/doc/svmult/"
  rm guideline/svmult.cls
  mv guideline "${pkgdir}/usr/share/doc/svmult/"
  cd ..
}

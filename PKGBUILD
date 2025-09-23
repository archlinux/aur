# Maintainer: gudzpoz <gudzpoz@live.com>

pkgname="emacs-chinese-word-segmentation-git"
pkgver=r75.fd2e711
pkgrel=1
pkgdesc="Chinese word segmentation tool for Emacs based on libjieba."
arch=('x86_64')
url="https://github.com/kanglmf/emacs-chinese-word-segmentation"
license=('GPL3')
depends=('emacs')
makedepends=('git' 'gcc' 'cmake' 'emacs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=cns.install
source=("${pkgname%-git}::git+https://github.com/kanglmf/emacs-chinese-word-segmentation.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    git submodule update --init --recursive
    make
    sed -e 's#(defcustom cns-dict-directory nil#(defcustom cns-dict-directory "/usr/share/emacs/site-lisp/cns"#' \
        -e 's#(defcustom cns-prog (executable-find "chinese-word-segmentation")#(defcustom cns-prog "/usr/share/emacs/site-lisp/cns/cnws"#' \
        -e "s#(defcustom cns-process-type 'network#(defcustom cns-process-type 'shell#" \
        cns.el > cns.configured.el
}

package() {
    cd "$srcdir/${pkgname%-git}"

    install -D -m644 cns.configured.el "${pkgdir}/usr/share/emacs/site-lisp/cns.el"
    emacs -batch -f batch-byte-compile "${pkgdir}/usr/share/emacs/site-lisp/cns.el"

    install -D -m755 cnws "${pkgdir}/usr/share/emacs/site-lisp/cns/cnws"
    install -D -m644 cppjieba/dict/jieba.dict.utf8 "${pkgdir}/usr/share/emacs/site-lisp/cns/jieba.dict.utf8"
    install -D -m644 cppjieba/dict/hmm_model.utf8 "${pkgdir}/usr/share/emacs/site-lisp/cns/hmm_model.utf8"
    install -D -m644 cppjieba/dict/user.dict.utf8 "${pkgdir}/usr/share/emacs/site-lisp/cns/user.dict.utf8"
    install -D -m644 cppjieba/dict/stop_words.utf8 "${pkgdir}/usr/share/emacs/site-lisp/cns/stop_words.utf8"
    install -D -m644 cppjieba/dict/idf.utf8 "${pkgdir}/usr/share/emacs/site-lisp/cns/idf.utf8"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 cppjieba/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.cppjieba"
}

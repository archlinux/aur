# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='build-generator'
pkgver=0.8.1.2bb6060
pkgrel=1
pkgdesc='Generates jobs on a Jenkins server according to specifications'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/build-generator'
license=('LGPL3')
depends=('openssl' 'git' 'subversion' 'unp' 'mercurial' 'lsb-release' 'graphviz')
makedepends=('git' 'cmake' 'sbcl' 'cl-launch')
options=("!strip")
source=("build-generator::git+https://code.cor-lab.org/git/build-generator#branch=0.8"
        "configuration-options::git+https://github.com/scymtym/configuration.options"
        "parser::git+https://github.com/scymtym/parser.ini"
        "rosetta::git+https://code.cor-lab.org/git/rosetta.git.cl"
        "architecture.builder-protocol::git+https://github.com/scymtym/architecture.builder-protocol")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd "${srcdir}/build-generator"
    printf "%s" "$(git describe --tags --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}"
    if ! [ -f quicklisp/setup.lisp ]
    then
        mkdir -p quicklisp
        curl -O http://beta.quicklisp.org/quicklisp.lisp
        sbcl --noinform --no-userinit --disable-debugger --load quicklisp.lisp --eval '(quicklisp-quickstart:install :path "'"$(pwd)"'/quicklisp")' --quit
    fi

    # hack custom quicklisp path into cl-launch
    sed -e 's#(try (subpathname (user-homedir-pathname) "quicklisp/setup.lisp"))#(try "'"${srcdir}"'/quicklisp/setup.lisp")\
        (try (subpathname (user-homedir-pathname) "quicklisp/setup.lisp"))#;' "$(which cl-launch)" > "${srcdir}/cl-launch"
    chmod +x "${srcdir}/cl-launch"

    # better version reporting
    echo "${pkgver}" | sed 's/.*\..*\.\(.*\)\.\(.*\)/\1 "\2"/' > "${srcdir}/build-generator/version.sexp"
}

build() {
    cd "${srcdir}/build-generator"
    export ASDF_OUTPUT_TRANSLATIONS="/:${srcdir}/fasl-cache"
    export CC=cc
    "${srcdir}/cl-launch" -Q \
        -S "(:source-registry \
             (:tree \""${srcdir}"\") \
             :ignore-inherited-configuration)" \
        -s jenkins.project.commandline-interface \
        -F 'rune-dom::(defun adjust-vector-exponentially (vector new-dimension set-fill-pointer-p)
  (let ((d (array-dimension vector 0)))
    (when (< d new-dimension)
      (loop
          do (setf d (max 1 (* 2 d)))
          while (< d new-dimension))
      (adjust-array vector d))
    (when set-fill-pointer-p
      (setf (fill-pointer vector) new-dimension))))' \
        --dump ! --output "build-generator" \
        -r "jenkins.project.commandline-interface:main"
}

package() {
    cd "${srcdir}/build-generator"
    install -D "${srcdir}/build-generator/build-generator" "${pkgdir}/usr/bin/build-generator"
}

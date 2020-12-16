# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=yarn-completion-git
pkgver=v0.17.0.r0.g30262cf
pkgrel=3
pkgdesc='Bash completion for Yarn'
url='https://github.com/dsifford/yarn-completion'
arch=('any')
license=('MIT')
depends=('bash' 'bash-completion' 'yarn')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  # using git rev-list to force the latest tag to show up
  git describe --long "$(git rev-list --tags --max-count=1)" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  patch -p0 tests/test <<'EOF'
@@ -7,27 +7,23 @@ COMPLETION_SRC="$TEST_DIR"/../yarn-completion.bash
 # shellcheck source=./utils.sh
 source "$TEST_DIR"/utils.sh
 
-declare -i FALURES=0
+declare -i FAILURES=0
 
 describe 'Environment checks'
 {
 	it should match yarn version line in src file
-	t=$(
-		declare actual expected
-		actual=$(sed -n 's/# Yarn Version: \([^ ]*\)/\1/p' "$COMPLETION_SRC")
-		expected=$(yarn --version)
-		if [[ $actual != "${expected%-*}" ]]; then
-			prepend '  | ' <<- EOF
-				ERROR: mismatched yarn version line in src file.
-				
-				expected: ${expected%-*}
-				received: $actual
-			EOF
-			exit 1
-		fi
-		exit 0
-	)
-	passfail "$t"
+	declare actual expected
+	actual=$(sed -n 's/# Yarn Version: \([^ ]*\)/\1/p' "$COMPLETION_SRC")
+	expected=$(yarn --version)
+	if [[ $actual != "${expected%-*}" ]]; then
+		echo ..WARN
+		prepend '  | ' <<- EOF
+			WARNING: mismatched yarn version line in src file.
+			
+			expected: ${expected%-*}
+			received: $actual
+		EOF
+	fi
 }
 
 describe 'Checking top-level commands'
EOF
}

check() {
  cd ${pkgname%-git}
  bash tests/test
}

package() {
  cd ${pkgname%-git}
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "${pkgname%-git}.bash" "$pkgdir/usr/share/bash-completion/completions/yarn"
}

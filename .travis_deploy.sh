[ ! -f *pkg.tar.xz ] && exit 0
eval "$(. PKGBUILD; epoch=${epoch:-0}; declare -p pkgname epoch pkgver pkgrel 2>/dev/null; )"
file_name="$pkgname-$([ $epoch -gt 0 ] && echo $epoch:)$pkgver-$pkgrel-x86_64.pkg.tar.xz"
git clone https://$GITHUB_ACCESS_TOKEN@github.com/bartoszek/AUR-repo.git
cd AUR-repo || exit 1
cp "$TRAVIS_BUILD_DIR/$file_name" $(pwd)
git add "$file_name"
git status
git commit -a -m "$pkgname $pkgver" -m "build_log: $TRAVIS_BUILD_WEB_URL" 
git pull --rebase && git push || true

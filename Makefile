.DELETE_ON_ERROR:
all: upgrade build verify

init:
	yay -S --needed devtools nvchecker namcap

clean:
	while read f; do rm -r $$f &>/dev/null || :; done < .gitignore

build:
	makepkg --printsrcinfo > .SRCINFO
	pkgctl build

install: build
	makepkg --install

upgrade:
	if [ -f .nvchecker.toml ]; then	\
		pkgctl version upgrade;	\
	else				\
		updpkgsums;		\
	fi

verify:
	shellcheck --shell=bash --exclude=SC2034,SC2154,SC2164 PKGBUILD
	pkgctl license check
	namcap PKGBUILD *.pkg.tar.zst

release:
	pkgctl release

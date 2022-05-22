# Thanks to zneix for this Makefile

.PHONY: all

all: clean srcinfo rebuild

rebuild:
	makepkg -s

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src dankerino/ chatterino2-*.pkg.tar.{xz,zst} \
		libcommuni \
		humanize \
		qBreakpad \
		WinToast \
		settings \
		signals \
		serialize \
		rapidjson \
		qtkeychain \
		sanitizers-cmake \
		websocketpp \
		magic_enum \
		googletest

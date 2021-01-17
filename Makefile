build:
	makepkg -si

update:
	updpkgsums

clean:
	rm -rf pkg src dmenu *.diff

purge:
	rm -rf pkg src dmenu *.diff *.zst

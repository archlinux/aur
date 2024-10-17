# Update notes
This is a very simple update that adds a single function to the code.  
That does not mean that this function is not important tho, in fact its really important, it ensures memory safety.  
The memory safety of jura was tested over a couple months, the latter of which were dedicated to ensuring memory safety

# Bug/vulnerability fixes
Memory leak vulnerability fixed, caused by not freeing pointers in the internal file configuration, this meant that memory blocks could still be reached after the program had been closed

**Full Changelog**: https://github.com/Nooberieno/jura/compare/4.1...4.2
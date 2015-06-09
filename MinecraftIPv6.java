import java.io.IOException;
import java.net.InetAddress;

import net.minecraft.bootstrap.Bootstrap;

/*
 * Launches minecraft forcing the usage of IPv6.
 * You should make sure minecraft.jar is added to the classpath
 * That's /usr/share/minecraft/minecraft.jar on most distros. 
 * 
 * This wrapper requires no future changes unless Mojang changes
 * the class containing main() in future.
 */
public class MinecraftIPv6 {

	public static void main(String[] args) throws IOException {
		// This is an IPv6 launcher, force IPv6, no matter what.
		System.setProperty("java.net.preferIPv6Addresses", "true");
		System.setProperty("java.net.preferIPv4Stack", "false");

		// InetAddress reads on it's first usage. If it's not used here,
		// Bootstrap will override it before using InetAddress, reverting the
		// above.
		InetAddress.getByName(null);

		// Call the actual game Bootstrap
		Bootstrap.main(args);
	}
}
